Ansible Role: InfluxDB
======================

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

Ansible role to deploy InfluxDB server on CentOS/RHEL systems


Requirements
------------

No special requirements.
Note this role requires root access; either run it in a playbook with a global `become: yes` or invoke the role in your playbook:

```yaml
- hosts: servers
  roles:
    - role: jwflory.influxdb
      become: yes
```


Role Variables
--------------

```yaml
db_fqdn: example.com
```

* **`db_fqdn`**: Hostname/FQDN of InfluxDB server


Dependencies
------------

None.


Example Playbook
----------------

```yaml
- hosts: influx_server
  roles:
     - role: jwflory.influxdb
```


License
-------

[Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/ "Mozilla Public License – Mozilla")

Author(s) accept changes made in `vars/` directory to be omitted in published derivative work.
Modifications to other aspects of the Ansible Role, that others could also benefit from, are expected to be open.


Author Information
------------------

This role was created in 2019 by [Justin W. Flory](https://justinwflory.com/).
Find him on [GitHub](https://github.com/jwflory "Check out other things I'm working on!") and [LinkedIn](https://www.linkedin.com/in/justinwflory/ "See what I'm doing out in the world…").
