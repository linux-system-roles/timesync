Changelog
=========

[1.9.0] - 2024-08-16
--------------------

### New Features

- feat: Handle reboot for transactional update systems (#256)

### Other Changes

- ci: Add workflow for ci_test bad, use remote fmf plan (#254)
- ci: Fix missing slash in ARTIFACTS_URL (#255)

[1.8.6] - 2024-08-01
--------------------

### Other Changes

- ci: Add tft plan and workflow (#248)
- docs: add module documentation for timesync_provider (#250)
- ci: Update fmf plan to add a separate job to prepare managed nodes (#251)
- ci: Bump sclorg/testing-farm-as-github-action from 2 to 3 (#252)

[1.8.5] - 2024-07-02
--------------------

### Bug Fixes

- fix: add support for EL10 (#245)
- fix: Don't use chrony-dhcp sourcedir on EL8 systems (#246)

### Other Changes

- ci: ansible-lint action now requires absolute directory (#244)

[1.8.4] - 2024-06-11
--------------------

### Other Changes

- ci: use tox-lsr 3.3.0 which uses ansible-test 2.17 (#239)
- ci: tox-lsr 3.4.0 - fix py27 tests; move other checks to py310 (#241)
- ci: Add supported_ansible_also to .ansible-lint (#242)

[1.8.3] - 2024-04-04
--------------------

### Other Changes

- ci: fix python unit test - copy pytest config to tests/unit (#234)
- ci: Bump ansible/ansible-lint from 6 to 24 (#235)
- ci: Bump mathieudutour/github-tag-action from 6.1 to 6.2 (#237)

[1.8.2] - 2024-01-16
--------------------

### Other Changes

- ci: support ansible-lint and ansible-test 2.16 (#231)
- ci: Use supported ansible-lint action; run ansible-lint against the collection (#232)

[1.8.1] - 2023-12-08
--------------------

### Other Changes

- ci: bump actions/github-script from 6 to 7 (#227)
- refactor: get_ostree_data.sh use env shebang - remove from .sanity* (#228)

[1.8.0] - 2023-11-29
--------------------

### New Features

- feat: support for ostree systems (#224)

[1.7.9] - 2023-11-06
--------------------

### Other Changes

- ci: Fix implicit octal values in main.yml (#220)
- ci: Add ALP-Dolomite var file (#221)

[1.7.8] - 2023-10-23
--------------------

### Other Changes

- Bump actions/checkout from 3 to 4 (#209)
- ci: ensure dependabot git commit message conforms to commitlint (#212)
- ci: use dump_packages.py callback to get packages used by role (#214)
- refactor: Add CentOS 7-8, RedHat 7-8 and AlmaLinux 8-9 var files (#216)
- ci: tox-lsr version 3.1.1 (#218)

[1.7.7] - 2023-09-11
--------------------

### Other Changes

- ci: Add markdownlint, test_converting_readme, and build_docs workflows (#205)

  - markdownlint runs against README.md to avoid any issues with
    converting it to HTML
  - test_converting_readme converts README.md > HTML and uploads this test
    artifact to ensure that conversion works fine
  - build_docs converts README.md > HTML and pushes the result to the
    docs branch to publish dosc to GitHub pages site.
  - Fix markdown issues in README.md
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- docs: Make badges consistent, run markdownlint on all .md files (#206)

  - Consistently generate badges for GH workflows in README RHELPLAN-146921
  - Run markdownlint on all .md files
  - Add custom-woke-action if not used already
  - Rename woke action to Woke for a pretty badge
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- ci: Remove badges from README.md prior to converting to HTML (#207)

  - Remove thematic break after badges
  - Remove badges from README.md prior to converting to HTML
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

[1.7.7] - 2023-09-11
--------------------

### Other Changes

- ci: Add markdownlint, test_converting_readme, and build_docs workflows (#205)

  - markdownlint runs against README.md to avoid any issues with
    converting it to HTML
  - test_converting_readme converts README.md > HTML and uploads this test
    artifact to ensure that conversion works fine
  - build_docs converts README.md > HTML and pushes the result to the
    docs branch to publish dosc to GitHub pages site.
  - Fix markdown issues in README.md
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- docs: Make badges consistent, run markdownlint on all .md files (#206)

  - Consistently generate badges for GH workflows in README RHELPLAN-146921
  - Run markdownlint on all .md files
  - Add custom-woke-action if not used already
  - Rename woke action to Woke for a pretty badge
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- ci: Remove badges from README.md prior to converting to HTML (#207)

  - Remove thematic break after badges
  - Remove badges from README.md prior to converting to HTML
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

[1.7.6] - 2023-07-19
--------------------

### Bug Fixes

- fix: facts being gathered unnecessarily (#202)

### Other Changes

- docs: Consistent contributing.md for all roles - allow role specific contributing.md section (#196)
- ci: update tox-lsr to version 3.0.0 (#197)
- ci: Add pull request template and run commitlint on PR title only (#198)
- ci: Rename commitlint to PR title Lint, echo PR titles from env var (#199)
- ci: ansible-lint - ignore var-naming[no-role-prefix] (#200)
- ci: ansible-test ignores file for ansible-core 2.15 (#201)

[1.7.5] - 2023-04-27
--------------------

### Other Changes

- test: check generated files for ansible_managed, fingerprint
- ci: Add commitlint GitHub action to ensure conventional commits with feedback

[1.7.4] - 2023-04-13
--------------------

### Other Changes

- use pipefail if shell uses pipes (#189)

[1.7.3] - 2023-04-06
--------------------

### Bug Fixes

- Update chrony.conf location for Debian (#187)

### Other Changes

- suppress shellcheck issue (#176)
- Fix jinja formatting issue (#178)
- Add README-ansible.md to refer Ansible intro page on linux-system-roles.github.io (#185)
- Fingerprint RHEL System Role managed config files (#186)

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
