timesync
========
![CI Testing](https://github.com/linux-system-roles/timesync/workflows/tox/badge.svg)

This role installs and configures an NTP and/or PTP implementation to operate
<!--- wokeignore:rule=slave -->
as an NTP client and/or PTP slave in order to synchronize the system clock with
<!--- wokeignore:rule=master -->
NTP servers and/or grandmasters in PTP domains. Supported NTP/PTP
implementations are chrony, ntp (the reference implementation) and linuxptp.

Warning
-------

The role replaces the configuration of the given or detected provider
service on the managed host. Previous settings will be lost, even if
they are not specified in the role variables (no attempt is made to
preserve or merge the previous settings, the configuration files are
replaced entirely). The only setting which is preserved is the choice
of provider if `timesync_ntp_provider` is not defined (see the
description of this variable below).

Role Variables
--------------

The variables that can be passed to this role are as follows:

```yaml
# List of NTP servers
timesync_ntp_servers:
  - hostname: foo.example.com   # Hostname or address of the server
    minpoll: 4                  # Minimum polling interval (default 6)
    maxpoll: 8                  # Maximum polling interval (default 10)
    iburst: true                # Flag enabling fast initial synchronization
                                # (default false)
    pool: false                 # Flag indicating that each resolved address
                                # of the hostname is a separate NTP server
                                # (default false)
    nts: false                  # Flag enabling Network Time Security (NTS)
                                # authentication mechanism (default false,
                                # supported only with chrony >= 4.0)
    prefer: false               # Flag marking the source to be preferred for
                                # synchronization over other sources
                                # (default false)
    trust: false                # Flag marking the source to be trusted over
                                # sources that don't have this flag
                                # (default false)
    xleave: false               # Flag enabling interleaved mode (default false)
    filter: 1                   # Number of NTP measurements per clock update
                                # (default 1)

# List of PTP domains
timesync_ptp_domains:
  - number: 0                   # PTP domain number
    interfaces: [eth0]          # List of interfaces in the domain
    delay: 0.000010             # Assumed maximum network delay to the
                                # grandmaster in seconds # wokeignore:rule=master
                                # (default 100 microsecond)
    transport: UDPv4            # Network transport: UDPv4, UDPv6, L2
                                # (default UDPv4)
    udp_ttl: 1                  # TTL for UDPv4 and UDPv6 transports
                                # (default 1)
    hybrid_e2e: false           # Flag enabling unicast end-to-end delay
                                # requests (default false)

# Flag enabling use of NTP servers provided by DHCP (default false)
timesync_dhcp_ntp_servers: false

# Minimum offset of the clock which can be corrected by stepping (default is
# specific to NTP/PTP implementation: chrony 1.0, ntp 0.128, linuxptp 0.00002).
# Zero threshold disables all steps.
timesync_step_threshold: 1.0

# Maximum root distance to accept measurements from NTP servers
# Set to 0 to use provider default
timesync_max_distance: 0

# Minimum number of selectable time sources required to allow synchronization
# of the clock (default 1)
timesync_min_sources: 1

# List of interfaces which should have hardware timestamping enabled for NTP
# (default empty list). As a special value, '*' enables the timestamping on all
# interfaces that support it.
timesync_ntp_hwts_interfaces: ["*"]

# Name of the package which should be installed and configured for NTP.
# Possible values are "chrony" and "ntp". If not defined, the currently active
# or enabled service will be configured. If no service is active or enabled, a
# package specific to the system and its version will be selected.
timesync_ntp_provider: chrony

# Sometimes administrators might need extended configurations for chrony which
# are not covered by the predefined settings provided by this role.
# 'timesync_chrony_custom_settings' allows to define a list of custom settings
# for the chrony.conf file, by providing a list of settings. As an example,
# for debugging, one might need to log mesurements, statistics and tracking.
# This information is usually stored in the /var/log/chrony directory. For
# that, one needs to define two different settings (logdir and log), as
# follows:
timesync_chrony_custom_settings:
  - "logdir /var/log/chrony"
  - "log measurements statistics tracking"
```

Example Playbook
----------------

Install and configure ntp to synchronize the system clock with three NTP servers:

```yaml
- hosts: targets
  vars:
    timesync_ntp_servers:
      - hostname: foo.example.com
        iburst: true
      - hostname: bar.example.com
        iburst: true
      - hostname: baz.example.com
        iburst: true
  roles:
    - linux-system-roles.timesync
```

Install and configure linuxptp to synchronize the system clock with a
<!--- wokeignore:rule=master -->
grandmaster in PTP domain number 0, which is accessible on interface eth0:

```yaml
- hosts: targets
  vars:
    timesync_ptp_domains:
      - number: 0
        interfaces: [eth0]
  roles:
    - linux-system-roles.timesync
```

Install and configure chrony and linuxptp to synchronize the system clock with
multiple NTP servers and PTP domains for a highly accurate and resilient
synchronization:

```yaml
- hosts: targets
  vars:
    timesync_ntp_servers:
      - hostname: foo.example.com
        maxpoll: 6
      - hostname: bar.example.com
        maxpoll: 6
      - hostname: baz.example.com
        maxpoll: 6
    timesync_ptp_domains:
      - number: 0
        interfaces: [eth0, eth1]
        transport: L2
        delay: 0.000010
      - number: 1
        interfaces: [eth2]
        transport: UDPv4
        delay: 0.000010
  roles:
    - linux-system-roles.timesync
```

Install and configure chrony with multiple NTP servers and custom advanced
settings: log `measurements`, `statistics` and `tracking`
into `/var/log/chrony`:


```yaml
- hosts: targets
  vars:
    timesync_ntp_servers:
      - hostname: foo.example.com
      - hostname: bar.example.com
      - hostname: baz.example.com
    timesync_chrony_custom_settings:
      - "logdir /var/log/chrony"
      - "log measurements statistics tracking"
  roles:
    - linux-system-roles.timesync
```
