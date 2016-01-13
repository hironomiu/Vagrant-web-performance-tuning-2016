class php::install{
#    yumrepo { 'php-epel':
#        descr => 'epel repo',
#        mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch',
#        enabled    => 1,
#        gpgcheck   => 1,
#        gpgkey     => 'https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7',
#    }
#
#    yumrepo { 'php-remi':
#        descr => 'remi repo',
#        mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/mirror',
#        enabled        => 0,
#        gpgcheck       => 1,
#        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
#        priority       => 1,
#        require => Yumrepo['php-epel'],
#    }

    package{'epel-release':
        provider => 'yum',
        ensure => installed
    }
    
    package { 'remi-release':
        ensure   => installed,
        source   => 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm',
        # source   => 'http://remi.kazukioishi.net/enterprise/remi-release-6.rpm',
        provider => rpm,
        require  => Package['epel-release'],
    }

    package{ 
        [
        'php',
        'php-cli',
        'php-common',
        'php-devel',
        'php-pdo',
        'php-xml',
        'php-mbstring',
        'php-mysqlnd',
        'php-pecl-memcached',
        'php-pecl-xdebug',
        'php-opcache',
        'php-fpm',
        'php-mcrypt',
        'libmcrypt',
        'siege',
        'httpd',
        'memcached',
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi,remi-php56'],
       # require => Yumrepo['php-remi']
        require => Package['remi-release']
    }

    package{
        [
        'openssh-clients',
        'wget',
        'git',
        'screen',
        'unzip',
        'make',
        'dstat',
        'emacs',
        'vim-enhanced',
        'telnet',
        'tree',
        'sysstat',
        'perf',
        'cronie-noanacron',
        'npm',
        ]:
        provider => 'yum',
        ensure => installed,
        # require => Yumrepo['php-remi']
        require => Package['remi-release']
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        # require => Yumrepo['php-remi'],
        require => Package['remi-release']
    }

}
