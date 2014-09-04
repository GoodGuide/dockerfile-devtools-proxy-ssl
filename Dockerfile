FROM goodguide/base

RUN aptitude install -y nginx openssl

RUN rm -rf /etc/nginx/sites* /etc/nginx/conf.d/
ADD nginx.conf /etc/nginx/

ADD openssl.cnf /etc/ssl/

ADD run.sh /bin/
ADD generate_ssl_certs.sh /bin/

EXPOSE 80
CMD ["/bin/run.sh"]
