class php::install{
    package{'epel-release':
        provider => 'yum',
        ensure => installed
    }
    
    package { 'remi-release':
        ensure   => installed,
        source   => 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm',
        provider => rpm,
        require  => Package['epel-release'],
    }

    package{ 
        'php':
        provider => 'yum',
        ensure => 'latest',
        install_options => ['--enablerepo=remi,remi-php56'],
        require => Package['remi-release']
    }
    package{ 
        [
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
        ensure => 'latest',
        install_options => ['--enablerepo=remi,remi-php56,epel'],
        require => Package['php']
    }

   # package{
   #     [
   #     'openssh-clients',
   #     'wget',
   #     'git',
   #     'screen',
   #     'unzip',
   #     'make',
   #     'dstat',
   #     'emacs',
   #     'vim-enhanced',
   #     'telnet',
   #     'tree',
   #     'sysstat',
   #     'perf',
   #     'cronie-noanacron',
   #     'npm',
   #     ]:
   #     provider => 'yum',
   #     ensure => latest,
   #     install_options => ['--enablerepo=remi,remi-php56'],
   #     require => Package['remi-release']
   # }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Package['remi-release']
    }

}
