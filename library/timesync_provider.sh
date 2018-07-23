#!/bin/bash
# WANT_JSON

is_service_enabled() {
	local name=$1 runlevel prev_runlevel

	read -r prev_runlevel runlevel < <(runlevel)

	systemctl is-enabled $name.service &> /dev/null || \
		chkconfig --list $name 2>/dev/null | grep -q "$runlevel:on"
}

is_service_active() {
	local name=$1

	systemctl is-active $name.service &> /dev/null || \
		service $name status &>/dev/null
}

get_current_ntp_providers() {
	is_service_active chronyd || is_service_enabled chronyd && echo chrony
	is_service_active ntpd || is_service_enabled ntpd && echo ntp
}

get_default_ntp_provider() {
	[ -e /etc/os-release ] && . /etc/os-release &> /dev/null

	case "$ID" in
		rhel|centos)
			[ ${VERSION_ID%.*} -lt 7 ] && echo ntp || echo chrony
			;;
		*)
			echo chrony
			;;
	esac
}

current_ntp_providers=$(get_current_ntp_providers)

case $(echo -n "$current_ntp_providers" | wc -w) in
	0)
		ntp_provider=$(get_default_ntp_provider)
		;;
	1)
		ntp_provider=$current_ntp_providers
		;;
	*)
		ntp_provider=""
		error_message="Multiple NTP providers are currently active/enabled."
		;;
esac

if [ -n "$ntp_provider" ]; then
	printf '{"ansible_facts": {"ntp_provider": "%s"}}' "$ntp_provider"
else
	printf '{"failed": "True", "msg": "%s"}' "$error_message"
fi
