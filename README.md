# 基础镜像 WEB Apache HTTP Server 2.4.41

Base Image For Web With httpd 2.4.41-alpine

## Config

- **Web Root**  : /var/www/html
- **CGI Root**  : /var/www/cgi-bin
- **Web Port**  : 80
- **Flag Path** : /flag

You can set your flag path by modify `/_files/flag.sh`

```bash
#!/bin/sh

# echo $FLAG > /flag
echo $FLAG > /for/yout/path/file

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh
```

## Test CGI

[http://127.0.0.1:8085/cgi-bin/testcgi.sh](http://127.0.0.1:8085/cgi-bin/testcgi.sh)