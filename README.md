# Vagrant-web-performance-tuning-2016環境

## ベースOS
CentOS7

## Install
```
$ git clone ~
$ cd Vagrant-web-performance-tuning-2016
$ vagrant up 
```

## ユーザ
### OS
|ユーザ|パスワード|
|:-:|:-:|
|root|puppet|
|vagrant|vagrant|
|demouser|demouser|

### MySQL
|ユーザ|パスワード|
|:-:|:-:|
|root|vagrant|
|demouser|demopass|

## Login
vagrant

```
$ vagrant ssh
```

vagrantからsudoでrootに遷移可能

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

