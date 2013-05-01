node 'doctrine.local'
{
    class {"dns_issue_hack":
        stage => init;
    } ->
    class {"update_sources":
        stage => init;
    }

    include oracle::server
    include oracle::swap
    include oracle::xe

    user { "vagrant":
        groups => "dba",
        require => Service["oracle-xe"],
    }

    class { 'postgresql::server':
        config_hash => {
            'ip_mask_deny_postgres_user' => '0.0.0.0/32',
            'ip_mask_allow_all_users'    => '0.0.0.0/0',
            'listen_addresses'           => '*',
            'ipv4acls'                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
            'postgres_password'          => 'doctrine',
        },
    }

    postgresql::db { 'doctrine_tests':
      user     => 'doctrine',
      password => 'doctrine'
    }

    postgresql::db { 'doctrine_tests_tmp':
      user     => 'doctrine',
      password => 'doctrine'
    }

    class { 'mysql::server':
      config_hash => { 'root_password' => '' }
    }

    mysql::db { 'doctrine_tests':
        user     => 'doctrine',
        password => 'doctrine',
        host     => 'localhost',
        grant    => ['all'],
    }

    mysql::db { 'doctrine_tests_tmp':
        user     => 'doctrine_tmp',
        password => 'doctrine',
        host     => 'localhost',
        grant    => ['all'],
    }
}
