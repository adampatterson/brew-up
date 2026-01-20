# Nginx Configuration

These are some common changes that have been required in the past.

Edit the `/nginx/nginx.conf` file and add the following near the top of the `http {}` block.

```nginx configuration
server_names_hash_bucket_size 128;
server_names_hash_max_size 512;

map_hash_bucket_size 128;
map_hash_max_size 128;
```

At the bottom of the `http {}` block I like to specify `.conf` files.

```
- include servers/*;
+ include servers/*.conf;
```

## PHP

Create a config file for each version of PHP in the `/snippets` folder.

`/nginx/snippets/php84.conf`

The `fastcgi_pass` address should match your PHP-FPM port, for example:

PHP 8.4 would be `127.0.0.1:9084`

Included is PHP 8.2 and 8.4.

## Adding Basic Authentication

Under `/snippets/password.conf` is an example of how to add basic authentication to a site.

The username and password is `testing` and `internets`.

## Adding Sites

If you look at `05-laravel.conf` you'll see an example that works for Laravel and WordPress.

The example also includes basic auth and the PHP snippet which is commented out.
