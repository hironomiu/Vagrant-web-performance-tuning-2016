class user-group::config{
    include php::install
    Class['php::install'] -> Class['user-group::config']

    group { 'demogroup':
        ensure => present,
        gid => 505,
    }

    user { 'demouser':
        ensure => present,
        gid => 'demogroup',
        comment => 'demouser',
        home => '/home/demouser',
        managehome => true,
        shell => '/bin/bash',
        require => Group["demogroup"]
    }

    file { '/home/demouser/.ssh':
        ensure => directory,
        owner => 'demouser',
        group => 'demogroup',
        mode => '0700',
        require => User["demouser"]
    }

    file { '/home/demouser/web-performance-tuning':
        ensure => directory,
        owner => 'demouser',
        group => 'demogroup',
        mode => '0755',
        require => User["demouser"]
    }

    file { '/home/demouser/web-performance-tuning/public_html':
        ensure => directory,
        owner => 'demouser',
        group => 'demogroup',
        mode => '0755',
        require => File["/home/demouser/web-performance-tuning"]
    }

    exec { "passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "demouser" | passwd --stdin demouser',
        timeout => 999,
        require => File['/home/demouser/.ssh']
    }

    exec { "chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/demouser",
        timeout => 999,
        require => Exec['passwd']
    }

    exec { "usermod apache" :
        user => 'root',
        path => ['/usr/sbin'],
        command => "usermod -G demogroup apache",
        timeout => 999,
        require => Exec['chmod']
    }

    exec { "jmeter get" :
        user => 'demouser',
        path => ['/bin'],
        command => "/bin/wget http://ftp.jaist.ac.jp/pub/apache//jmeter/binaries/apache-jmeter-3.0.tgz",
        logoutput => on_failure,
        cwd => "/home/demouser",
        creates => "/home/demouser/apache-jmeter-3.0.tgz",
        timeout => 999,
        require => Exec['usermod apache']
    }

    exec { "jmeter tar" :
        user => 'demouser',
        path => ['/bin'],
        command => "/bin/tar xvfz apache-jmeter-3.0.tgz",
        logoutput => on_failure,
        cwd => "/home/demouser",
        timeout => 999,
        require => Exec['jmeter get']
    }
}
