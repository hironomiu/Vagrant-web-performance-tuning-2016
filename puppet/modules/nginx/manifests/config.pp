class nginx::config{
    file { '/etc/nginx/nginx.conf':
        owner => 'root', group => 'root',
        content => template('nginx/nginx.conf'),
    }
    file { '/etc/nginx/conf.d/reverse.conf':
        owner => 'root', group => 'root',
        content => template('nginx/reverse.conf'),
    }
    file { '/etc/nginx/conf.d/my.conf':
        owner => 'root', group => 'root',
        content => template('nginx/my.conf'),
    }
    file { '/etc/nginx/conf.d/default.conf':
        owner => 'root', group => 'root',
        content => template('nginx/default.conf'),
    }
}
