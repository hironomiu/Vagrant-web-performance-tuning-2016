class memcached::service {
    service{ 'memcached':
        enable => true,
        ensure => running,
        hasrestart => true,
    }
}
