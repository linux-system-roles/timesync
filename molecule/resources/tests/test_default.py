import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'

# def check_ntp_client(host):
#     host.ansible("service_facts")
#     host_vars = host.ansible.get_variables()
#      host_vars['ntp_client']
#     host_vars['service']
