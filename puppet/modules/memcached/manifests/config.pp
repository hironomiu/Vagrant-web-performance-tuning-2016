class memcached::config{
    file { "/etc/sysconfig/memcached":
        owner => "root", group => "root",
        content => template('memcached/memcached'),
        notify => Service['memcached'],
    }
}
