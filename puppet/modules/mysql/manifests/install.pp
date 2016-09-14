class mysql::install{
    package{
        "mariadb-libs" :
        ensure => purged,
    }

    package{ 
        "perl-Data-Dumper" :
        provider => 'yum',
        ensure => installed,
        require => Package['mariadb-libs'],
    }

    package { 'mysql-community-release-el7-5.noarch.rpm':
        ensure   => installed,
        source   => 'http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm',
        provider => 'rpm',
        install_options => ['--replacefiles'],
        require  => Package['perl-Data-Dumper'],
    }

    package{ 
        "mysql-community-server" :
        provider => 'yum',
        ensure => installed,
        install_options => [{'--enablerepo' => 'mysql56-community'}],
        require => Package['mysql-community-release-el7-5.noarch.rpm'],
    }

}
