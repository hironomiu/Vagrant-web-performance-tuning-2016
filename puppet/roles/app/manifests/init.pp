class app {
    include app::localtime
    include app::lang
    include app::mysql
    include app::db-demouser
    include app::php
    include app::user-group
    include app::nginx
    include app::memcached
    include app::sshd
#    include app::iptables
    include app::varnish
}
