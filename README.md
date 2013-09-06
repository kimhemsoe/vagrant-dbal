# Doctrine Vagrant

Vagrant Box to setup database dependencies for the DBAL/ORM projects.

It currently installs:

- MySQL
- PostgreSQL
- Oracle

Usage:

    vagrant up

## Oracle

For Oracle to work, you need to download the RPM from the Oracle website here:

http://www.oracle.com/technetwork/products/express-edition/downloads/index.html

For this you need to accept the license and create an account on the Oracle page.

Download `oracle-xe-11.2.0-1.0.x86_64.rpm.zip` and put it into the `modules/oracle/files` of
this project.

You can use Oracle with the admin account "system" and password "manager".

## Acknowledgements

The Oracle Module is integrated from: https://github.com/hilverd/vagrant-ubuntu-oracle-xe
