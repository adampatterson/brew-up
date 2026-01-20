# PHP Configuration

**For each version of PHP you have installed, update the port number in the following files:**

`/8.version/php-fpm.d/www.conf`

```
- listen = 127.0.0.1:9000
+ listen = 127.0.0.1:9082
```

`/8.version/php.ini`

Consider updating the following values:

```
- max_execution_time = 30
+ max_execution_time = 240
- max_input_time = 60
+ max_input_time = 128
- max_input_vars = 1000
+ max_input_vars = 10000
- memory_limit = 128M
+ memory_limit = 724M
- error_reporting = E_ALL
+ error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT
- post_max_size = 8M
+ post_max_size = 128M
- upload_max_filesize = 2M
+ upload_max_filesize = 20M
```
