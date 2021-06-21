docker_cleanup
=========

Diese Rolle installiert einen dcleaner.sh cronjob.  
Dcleaner ist ein Skript, um alte oder ungenutzte Container Images zu löschen.

Requirements
------------

* docker-ce 
* Docker CLI
* Docker Rechte für Ansible User


Role Variables
--------------

    # Cronjob Trigger
    cron_hour: 4
    cron_minute: 0
    cron_weekday: "*"

    # DCleaner Parameter
    cron_dcleaner_params: "old"

    # Pfad für die Installation
    dcleaner_path: "/usr/local/bin"

Für mehr Informationen über die dcleaner Parameter:  
[dcleaner Skript](https://raw.githubusercontent.com/mahaupt/docker-cleanup/master/files/dcleaner.sh)

Author Information
------------------

[Marcel Haupt](https://github.com/mahaupt)
