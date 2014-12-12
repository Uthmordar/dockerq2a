From alain75007/debian
MAINTAINER tanguy godin <tanguyrygodin@gmail.com>

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 php5 php5-mysql php5-gd curl nano
RUN cd /var/www && git clone https://github.com/q2a/question2answer.git
WORKDIR /var/www/question2answer
RUN mv /var/www/question2answer/qa-config-example.php /var/www/question2answer/qa-config.php
RUN apt-get -y install mysql-client
ADD mysql.sh /var/www/question2answer/mysql.sh

EXPOSE 80
RUN apt-get clean

CMD chmod 777 /var/www/question2answer/mysql.sh && mysql.sh && /usr/bin/apachectl -D 'FOREGROUND'
