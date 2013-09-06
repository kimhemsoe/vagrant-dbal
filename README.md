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

The following parts of `oracle.phpunit.xml` then works on your system:

```xml
<!-- "Real" test database -->
<var name="db_type" value="oci8"/>
<var name="db_host" value="localhost" />
<var name="db_username" value="doctrine_tests" />
<var name="db_password" value="manager" />
<var name="db_name" value="XE" />
<var name="db_port" value="81521"/>
<var name="db_event_subscribers" value="Doctrine\DBAL\Event\Listeners\OracleSessionInit"/>

<!-- Database for temporary connections (i.e. to drop/create the main database) -->
<var name="tmpdb_type" value="oci8"/>
<var name="tmpdb_host" value="localhost" />
<var name="tmpdb_username" value="system" />
<var name="tmpdb_password" value="manager" />
<var name="tmpdb_name" value="XE" />
<var name="tmpdb_port" value="81521"/>
```


## Acknowledgements

The Oracle Module is integrated from: https://github.com/hilverd/vagrant-ubuntu-oracle-xe
