class memcached::install{
    yumrepo { 'remi_mem':
        descr => 'remi repo',
        mirrorlist => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
    }

    package{
        [
        'memcached',
        ]:
        provider => 'yum',
        ensure => installed,
        require => Yumrepo['remi_mem'],
    }
}
