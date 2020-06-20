FROM httpd:2.4
RUN apt-get update -y && apt-get install -y curl
RUN echo "httpd-foreground" > deployt.sh
RUN chmod +x deployt.sh
RUN sed -i '$ a Listen 8081' /usr/local/apache2/conf/httpd.conf
RUN sed -i '$ a Listen 443' /usr/local/apache2/conf/httpd.conf
EXPOSE 80 8081 443
#RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/apache2/deployt.sh"]