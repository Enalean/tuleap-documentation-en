Requirements
============

To install Tuleap you will need a **fully dedicated server**. It can be **virtualized or physical**.
It is not recommended to install Tuleap on a server that hosts other applications. Tuleap provides
a full suite of software and is deeply integrated with its host system. Installing Tuleap on a server shared with other applications
will certainly cause problems in both Tuleap and your other applications.

Tuleap can be installed on the following Linux x86_64 systems:
 - CentOS or Red Hat Enterprise Linux (RHEL) 7.x **(LEGACY)**. The details of the installation on this system is not covered in this guide.
 - **Enterprise Linux 9 (RHEL, Rocky, Alma Linux 9)**.

**You must disable SELinux** prior to the install.

The server will need an Internet connection as it will download external packages.

Database
````````

Database must be MySQL v8.0. As an alternative, MariaDB 10.3 can be used but was never tested in production.

The database **must** be dedicated to Tuleap. Either it's a local installation (as described below, perfect for small & medium instances) or provided by an external service.

Shared databases must not be used:

- they cannot guarantee the needed Quality of service
- they cannot respect the requirements (SQL modes) described below
- they make consistent backups almost impossible
