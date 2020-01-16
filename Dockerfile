FROM httpd:2.4.41-alpine

LABEL Organization="CTFHUB" Author="Virink <virink@outlook.com>"

COPY _files /tmp/

RUN mv /tmp/flag.sh /flag.sh \
    # Configure Web Root
    && mkdir -p /var/www/html /var/www/cgi-bin \
    && mv /tmp/testcgi.sh /var/www/cgi-bin/testcgi.sh \
    && echo '<h1>Ok</h1>' > /var/www/html/index.html \
    && chown -R www-data:www-data /var/www \
    && chmod 755 /var/www/cgi-bin/testcgi.sh; \
    # Configure Httpd
    mv -f /tmp/httpd.conf /usr/local/apache2/conf/httpd.conf; \
    chmod 644 /usr/local/apache2/conf/httpd.conf; \
    # httpd-foreground
    mv /tmp/httpd-foreground /usr/local/bin/docker-entrypoint \
    && chmod +x /usr/local/bin/docker-entrypoint

WORKDIR /var/www/html

CMD ["docker-entrypoint"]

EXPOSE 80
