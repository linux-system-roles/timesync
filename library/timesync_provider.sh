#!/bin/bash
# WANT_JSON

is_service_enabled() {
	local name runlevel prev_runlevel
	name="$1"

	read -r prev_runlevel runlevel < <(runlevel)
	prev_runlevel="${prev_runlevel}"  # shell check complains unused var

	systemctl is-enabled "$name.service" &> /dev/null || \
		chkconfig --list "$name" 2>/dev/null | grep -q "$runlevel:on"
}

is_service_active() {
	local name=$1

	systemctl is-active "$name.service" &> /dev/null || \
		service "$name" status &>/dev/null
}

get_current_ntp_providers() {
	is_service_active chronyd || is_service_enabled chronyd && echo chrony
	is_service_active ntpd || is_service_enabled ntpd && echo ntp
}


current_ntp_providers=$(get_current_ntp_providers)

ntp_provider_count=$(echo -n "$current_ntp_providers" | wc -w)

case $ntp_provider_count in
	0)
		ntp_provider_current=""
		;;
	1)
		ntp_provider_current=$current_ntp_providers
		;;
	*)
		ntp_provider_current=""
		error_message="Multiple NTP providers are currently active/enabled."
		;;
esac

if [ -z "$error_message" ]; then
	printf '{"ansible_facts": {"timesync_ntp_provider_current": "%s"}}' "$ntp_provider_current"
else
	printf '{"failed": "True", "msg": "%s"}' "$error_message"
fi
