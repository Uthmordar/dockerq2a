#!/bin/bash
mysql -u root -p $MYSQL_ENV_MYSQL_ROOT_PASSWORD --host $MYSQL_PORT_3306_TCP_ADDR
<<@ create database IF NOT EXISTS $Q2A_DATABASENAME;
@
perl -pi -e "s/127.0.0.1/$MYSQL_PORT_3306_TCP_ADDR/" qa-config.php
perl -pi -e "s/your-mysql-username/root" qa-config.php
perl -pi -e "s/your-mysql-password/$MYSQL_ENV_MYSQL_ROOT_PASSWORD" qa-config.php
perl -pi -e "s/your-mysql-db-name/$Q2A_DATABASENALE" qa-config.php
$0
