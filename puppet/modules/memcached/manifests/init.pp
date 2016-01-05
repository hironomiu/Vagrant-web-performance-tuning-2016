class memcached{
    include memcached::install
    include memcached::config
    include memcached::service

       Class['memcached::install']
    -> Class['memcached::config']
    ~> Class['memcached::service']
}
