Changelog
=========

[1.7.2] - 2023-01-20
--------------------

### New Features

- none

### Bug Fixes

- fixes for ansible-lint 6.x

### Other Changes

- ensure ethtool is installed where needed
- Add check for non-inclusive language;  (#170)
- Clean up / Workaround non-inclusive words
- update ignore files for ansible-test 2.14 (#172)

[1.7.1] - 2022-11-01
--------------------

### New Features

- none

### Bug Fixes

- none

### Other Changes

- Update timestamping checks using ethtool

New ethtool versions don't print the upper-case timestamping constants
anymore. Match the lower-case strings instead.

[1.7.0] - 2022-09-19
--------------------

### New Features

- adding support fpr Oracle Linux 6,7,8 and 9

### Bug Fixes

- Update chrony.conf.j2

Variables are defined as string in Jinja2 template and the operators 
on line 26 gives '<'  not supported between instances of 'str' and 'float
on line 43 gives '>' not supported between instances of 'str' and 'float

- Updated: type casting in overall timesync templates for testing

- Updated: type casting adjusted (timesync_max_distance <= int)


### Other Changes

- use ansible_playbook_filepath for ansible-playbook command

[1.6.9] - 2022-07-19
--------------------

### New Features

- none

### Bug Fixes

- none

### Other Changes

- make all tests work with gather_facts: false

Ensure all tests work when using ANSIBLE_GATHERING=explicit

- make min_ansible_version a string in meta/main.yml

The Ansible developers say that `min_ansible_version` in meta/main.yml
must be a `string` value like `"2.9"`, not a `float` value like `2.9`.

- Add CHANGELOG.md

[1.6.8] - 2022-05-06
--------------------

### New Features

- none

### Bug Fixes

- none

### Other Changes

- bump tox-lsr version to 2.11.0; remove py37; add py310

[1.6.7] - 2022-04-14
--------------------

### New Features

- support gather\_facts: false; support setup-snapshot.yml

### Bug Fixes

- none

### Other Changes

- none

[1.6.6] - 2022-02-28
--------------------

### New Features

- none

### Bug Fixes

- handle errors with stopping services

### Other Changes

- bump tox-lsr version to 2.10.1

[1.6.5] - 2022-01-12
--------------------

### New Features

- Initial version for Debian

### Bug Fixes

- none

### Other Changes

- none

[1.6.4] - 2022-01-10
--------------------

### New Features

- none

### Bug Fixes

- Fix an issue if a service is listed by service\_facts that does not have the 'status' property defined

### Other Changes

- bump tox-lsr version to 2.8.3
- change recursive role symlink to individual role dir symlinks

[1.6.3] - 2021-11-22
--------------------

### New Features

- none

### Bug Fixes

- evaluate is\_ntp\_default as boolean, not string
- reject services which have a status == not-found
- also reject masked and failed services

### Other Changes

- update tox-lsr version to 2.8.0

[1.6.2] - 2021-11-08
--------------------

### New Features

- make role work with ansible-core-2.11 ansible-lint and ansible-test

### Bug Fixes

- none

### Other Changes

- update tox-lsr version to 2.7.1
- support python 39, ansible-core 2.12, ansible-plugin-scan
- Check port state in PTP tests

[1.6.1] - 2021-09-21
--------------------

### New Features

- replace json\_query with selectattr/map

### Bug Fixes

- Use {{ ansible\_managed | comment }} to fix multi-line ansible\_managed

### Other Changes

- use apt-get install -y
- use tox-lsr version 2.5.1

[1.6.0] - 2021-08-10
--------------------

### New Features

- Raise supported Ansible version to 2.9

### Bug Fixes

- none

### Other Changes

- none

[1.5.0] - 2021-06-03
--------------------

### New Features

- Add NTS support

### Bug Fixes

- none

### Other Changes

- none

[1.4.1] - 2021-05-27
--------------------

### New Features

- none

### Bug Fixes

- none

### Other Changes

- CI: Add support for RHEL-9

[1.4.0] - 2021-05-06
--------------------

### New Features

- use public: true to expose role parameters; ansible 2.8
- Add hybrid\_e2e option to PTP domain

### Bug Fixes

- Cleaning up ansible-lint errors except 301 and 303.
- Fix ansible-test errors

### Other Changes

- tag tests with slow
- Remove python-26 environment from tox testing
- update to tox-lsr 2.4.0 - add support for ansible-test with docker

[1.3.0] - 2021-02-11
--------------------

### New Features

- Support chrony configuration in Fedora 33
- Add support for HW timestamping with NTP
- add timesync\_chrony\_custom\_settings variable for free-form local configs

### Bug Fixes

- Fix centos6 repos; use standard centos images; add centos8
- Fix package versions

### Other Changes

- use tox-lsr 2.2.0
- use molecule v3, drop v2
- remove ansible 2.7 support from molecule
- use tox for ansible-lint instead of molecule
- use new tox-lsr plugin
- use github actions instead of travis

[1.2.0] - 2020-11-02
--------------------

### New Features

- Add option to configure max distance 
- Use service\_facts instead of chkconfig/systemctl

### Bug Fixes

- none

### Other Changes

- add jmespath as dependency for molecule
- lock ansible-lint version at 4.3.5; suppress role name lint warning
- sync collections related changes from template to timesync role
- Lock ansible-lint on version 4.2.0

[1.1.0] - 2020-08-12
--------------------

### New Features

- Remove ignore\_errors for Disable services tasks

### Bug Fixes

- bug with current implementation of platform/version …
- add support for tox; fix yamllint issues
- use molecule v2
- Fix check mode
- Enable line-length check. Fix found issues.

### Other Changes

- Synchronize files from linux-system-roles/template
- sync with latest template including shellcheck

[1.0.2] - 2019-06-13
--------------------

### New Features

- Use linux-system-roles.timesync as name for role
- Use `is version` instead of `|version_compare`
- Add empty timesync\_ntp\_provider to defaults 

### Bug Fixes

- Remove unused/now invalid semaphore config
- Fixes for syntax problems found by Molecule
- Fix yamllint error
- Fix role to work in check mode

### Other Changes

- Add default vars test
- Run tests\_default both in normal and in check mode
- use yaml syntax
- Configure Molecule and Travis CI \(this PR should trigger build in CI\)
- Add example playbooks
- Add provision file to tests
- Add test for setting the default NTP provider for OS release

[1.0.1] - 2018-08-21
--------------------

### New Features

- none

### Bug Fixes

- none

### Other Changes

- Update Galaxy tags.

[1.0.0] - 2018-08-21
--------------------

### Initial Release
