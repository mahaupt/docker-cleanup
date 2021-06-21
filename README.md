docker_cleanup
=========

Diese Rolle installiert einen dcleaner.sh cronjob.  
Dcleaner ist ein script, um alte oder ungenutzte container images zu löschen.

Requirements
------------

Die docker-ce und die Docker CLI muss auf dem Zielsystem installiert sein.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }


Author Information
------------------

[Marcel Haupt](https://github.com/mahaupt)
