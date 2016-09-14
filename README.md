# Vagrant-web-performance-tuning-2016環境

## ベースOS
CentOS7

## Install
```
$ git clone ~
$ cd Vagrant-web-performance-tuning-2016
$ vagrant up 
```

## Login
vagrant

```
$ vagrant ssh
```

root sudoでrootに遷移可能

```
$ sudo su -
```

demouser アプリケーションユーザ
```
$ vagrant ssh
$ sudo su - demouser
```

## JMeterの利用例
demouserのホームディレクトリに配置
```
$ ~/apache-jmeter-3.0/bin/jmeter -n -t /vagrant/hoge.jmx
```

