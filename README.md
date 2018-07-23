timesync
========

This role installs and configures an NTP and/or PTP implementation to operate
as an NTP client and/or PTP slave in order to synchronize the system clock with
NTP servers and/or grandmasters in PTP domains. Supported NTP/PTP
implementations are chrony, ntp (the reference implementation) and linuxptp.

Role Variables
--------------

The variables that can be passed to this role are as follows:

```
# List of NTP servers
ntp_servers:
  - hostname: foo.example.com   # Hostname or address of the server
    minpoll: 4                  # Minimum polling interval (default 6)
    maxpoll: 8                  # Maximum polling interval (default 10)
    iburst: yes                 # Flag enabling fast initial synchronization
                                # (default no)
    pool: no                    # Flag indicating that each resolved address
                                # of the hostname is a separate NTP server
                                # (default no)

# List of PTP domains
ptp_domains:
  - number: 0                   # PTP domain number
    interfaces: [ eth0 ]        # List of interfaces in the domain
    delay: 0.000010             # Assumed maximum network delay to the
                                # grandmaster in seconds
                                # (default 100 microsecond)
    transport: UDPv4            # Network transport: UDPv4, UDPv6, L2
                                # (default UDPv4)
    udp_ttl: 1                  # TTL for UDPv4 and UDPv6 transports
                                # (default 1)

# Flag enabling use of NTP servers provided by DHCP (default no)
dhcp_ntp_servers: no

# Minimum offset of the clock which can be corrected by stepping (default is
# specific to NTP/PTP implementation: chrony 1.0, ntp 0.128, linuxptp 0.00002).
# Zero threshold disables all steps.
clock_step_threshold: 1.0

# Minimum number of selectable time sources required to allow synchronization
# of the clock (default 1)
min_time_sources: 1

# Name of the package which should be installed and configured for NTP.
# Possible values are "chrony" and "ntp". If not defined, the currently active
# or enabled service will be configured. If no service is active or enabled, a
# package specific to the system and its version will be selected.
ntp_provider: chrony
```

Example Playbook
----------------

Install and configure ntp to synchronize the system clock with three NTP servers:

```
- hosts: targets
  vars:
    ntp_servers:
      - hostname: foo.example.com
        iburst: yes
      - hostname: bar.example.com
        iburst: yes
      - hostname: baz.example.com
        iburst: yes
  roles:
    - timesync
```

Install and configure linuxptp to synchronize the system clock with a
grandmaster in PTP domain number 0, which is accessible on interface eth0:

```
- hosts: targets
  vars:
    ptp_domains:
      - number: 0
        interfaces: [ eth0 ]
  roles:
    - timesync
```

Install and configure chrony and linuxptp to synchronize the system clock with
multiple NTP servers and PTP domains for a highly accurate and resilient
synchronization:

```
- hosts: targets
  vars:
    ntp_servers:
      - hostname: foo.example.com
        maxpoll: 6
      - hostname: bar.example.com
        maxpoll: 6
      - hostname: baz.example.com
        maxpoll: 6
    ptp_domains:
      - number: 0
        interfaces: [ eth0, eth1 ]
        transport: L2
        delay: 0.000010
      - number: 1
        interfaces: [ eth2 ]
        transport: UDPv4
        delay: 0.000010
  roles:
    - timesync
```
