FROM amazonlinux

MAINTAINER mou.bhowmick4@gmail.com

RUN yum update -y
RUN yum install -y wget
RUN yum install -y tar
RUN yum install httpd php php-mysql mysql -y
RUN cd /var/www/html

RUN wget https://wordpress.org/wordpress-5.1.1.tar.gz
RUN tar -zxvf wordpress-5.1.1.tar.gz
RUN cp -r wordpress/* /var/www/html/
RUN rm -rf wordpress
RUN rm -rf wordpress-5.1.1.tar.gz
RUN chown -R apache:apache /var/www/html/

CMD ["/usr/bin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
