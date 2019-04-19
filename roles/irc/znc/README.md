Ansible Role: ZNC
=================

Ansible role to deploy ZNC server on CentOS/RHEL 7.x system


Requirements
------------

No special requirements.
Note this role requires root access; either run it in a playbook with a global `become: yes` or invoke the role in your playbook:

```yaml
- hosts: servers
  roles:
    - role: jwflory.teleirc
      become: yes
```


Role Variables
--------------

For `vault_znc_conf.admin_user.password` settings, use `znc --makepass` to generate the password hashes and salts.
You must update suggested Ansible Vault variables to your hash and salt for a successful initial login.

```yaml
znc_fqdn: example.com
znc_conf:
  admin_user:
    znc_username: znc-admin
    nick: znc-admin
    alt_nick: znc-admin_
    ident: zncadmin
    real_name: "Default ZNC admin user"
    password:
      hash: "{{ vault_znc_conf.admin_user.password.hash }}"
      salt: "{{ vault_znc_conf.admin_user.password.salt }}"
    primary_network:
      network_name: freenode
      server: "chat.freenode.net +6697"
  listener:
    port: 6697
    ipv4: true
    ipv6: true
    ssl: true
  version: 1.7.2
```

* **`…`**: to be written
* **`…`**: to be written
* **`…`**: to be written


Dependencies
------------

None.


Example Playbook
----------------

```yaml
- hosts: znc-host
  roles:
     - role: jwflory.znc
```


License
-------

[Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/ "Mozilla Public License – Mozilla")

Author(s) accept changes made to `vars/` to be omitted in published derivative work, as these are understood to be deployment-specific.
Modifications to other aspects of the Ansible Role that others could benefit from are expected to be open.


Author Information
------------------

This role was created in 2019 by [Justin W. Flory](https://justinwflory.com/).
Find him on [GitHub](https://github.com/jwflory "Check out other things I'm working on!") and [LinkedIn](https://www.linkedin.com/in/justinwflory/ "See what I'm doing out in the world…").
