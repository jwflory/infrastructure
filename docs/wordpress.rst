.. title: WordPress infrastructure SOP/Information
.. slug: wordpress
.. date: 2016-07-08
.. taxonomy: Contributors/Infrastructure

========================================
WordPress infrastructure SOP/Information
========================================

There are a few WordPress instances hosted within the Fedora Project for
publishing content related to the Fedora Project.

Contents
========

1. Background
2. Overview
3. Deployment
 a) MySQL/MariaDB databases
 b) Upgrades
4. Additional Reading/Resources

Contact Information
===================

Owner
	 Fedora Infrastructure Team
Contact
	 #fedora-admin
Location
	https://fedoramagazine.org
	https://communityblog.fedoraproject.org
Servers
	 
Purpose
   	To provide instructions in creating a new WordPress instance and/or
   	maintaining current installations 

Background
==========

This WordPress SOP was written as part of a Google Summer of Code 2016 project
proposal by jflory7_. The Ansible playbook(s) and other relevant assets were
part of the original proposal_.

For anything related to the management of the front-end of the WordPress sites,
e.g. content / articles, that is the responsible of the team maintaining the
publication. The Infrastructure team is only responsible for the technical
aspects of managing the installations, as far as upgrades, backups, and other
services. For the Magazine_, the point of contact for content is the Marketing_
team. For the `Community Blog`_, the CommOps_ team is the point of contact for
content. Anyone raising issues or requesting help with either site in a
non-technical manner should be directed to either team.

.. _jflory7: https://fedoraproject.org/wiki/User:Jflory7
.. _proposal: https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7
.. _Magazine: https://fedoramagazine.org/
.. _Marketing: https://fedoraproject.org/wiki/Marketing
.. _Community Blog: https://communityblog.fedoraproject.org/
.. _CommOps: https://fedoraproject.org/wiki/CommOps

Overview
========

WordPress is a PHP web app that requires a web server and MySQL database. It is
used to generate articles / posts and other dynamic content. For Fedora, it is
currently only used for the Fedora Magazine and the Fedora Community Blog.
WordPress hosting is not a service offered at this time.

Deployment
==========

To set up a new WordPress installation within Fedora's infrastructure, run the
following playbook on the desired target hosts::

    sudo rbac-playbook manual/wordpress-install.yml

MySQL/MariaDB databases
-----------------------

If setting up a new installation, all database-related tasks have to be done
manually. For security concerns, this process is not yet automated. If you do
not have the ability to do this, contact a member of sysadmin-main to help you.

Upgrades
--------

Upgrades can be completed via the WordPress front-end, but for the purpose of
taking backups, it is recommended to run the playbook method of upgrading the
site. Run the following playbook on the target hosts::

    sudo rbac-playbook manual/upgrade/wordpress.yml

Additional Reading/Resources
============================

Upstream docs: 
  https://codex.wordpress.org/

Google Summer of Code 2016 project proposal:
  https://fedoraproject.org/wiki/GSOC_2016/Student_Application_jflory7
