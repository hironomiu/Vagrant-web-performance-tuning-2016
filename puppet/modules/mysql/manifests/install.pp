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

    exec { "MySQL5.6" :
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => "yum -y install http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-devel-5.6.26-1.linux_glibc2.5.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-server-5.6.26-1.linux_glibc2.5.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-5.6.26-1.linux_glibc2.5.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-compat-5.6.26-1.linux_glibc2.5.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-client-5.6.26-1.linux_glibc2.5.x86_64.rpm",
        timeout => 999,
        unless => "yum list installed | grep MySQL",
        require => Package['perl-Data-Dumper'],
    }
}
