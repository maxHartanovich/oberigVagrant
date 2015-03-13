#!/bin/bash

path='/home/vagrant/php-zmq'

mkdir ${path}
chmod 777 ${path}
git clone git://github.com/mkoppanen/php-zmq.git ${path}

cd ${path}
sudo phpize && ./configure
make
make install

echo "[zmq]" >> /etc/php5/cli/php.ini
echo "extension=zmq.so" >> /etc/php5/cli/php.ini

echo "[zmq]" >> /etc/php5/fpm/php.ini
echo "extension=zmq.so" >> /etc/php5/fpm/php.ini

sudo service php5-fpm restart
