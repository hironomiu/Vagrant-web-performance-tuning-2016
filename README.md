# CentOS7環境

## Install
```
$ git clone git@github.com:hironomiu/Vagrant-CentOS7.git
```
or
```
$ git clone https://github.com/hironomiu/Vagrant-CentOS7.git
```

## Login
vagrant user
```
$ vagrant ssh
```
sudoでrootに遷移可能
```
$ sudo su -
```
## JMeterの利用例
demouserのホームディレクトリに配置
```
$ ~/apache-jmeter-3.0/bin/jmeter -n -t /vagrant/hoge.jmx
```

