FROM httpd

RUN sed -i 's/Options Indexes FollowSymLinks/Options FollowSymLinks/' /usr/local/apache2/conf/httpd.conf
RUN rm /usr/local/apache2/htdocs/index.html

CMD ["httpd-foreground"]

