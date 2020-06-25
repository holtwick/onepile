# WebDAV Sample Installation

A very widely used and open protocol for file storage is WebDAV. It is also a simple way to provide sync infrastructure on existing web servers.

This is an example how to enable WebDAV on your simple web hosting that supports PHP. It is a sample installation of [Sabre/DAV](http://sabre.io/dav/install/).

The installation can then be accessed like: `http://<your_domain>/onepile/server.php`.

## Installation on Apache

This sample works with Apache. Just copy the `onepile` folder to a web hosting instance. Make sure to adjust paths if required.

Make sure the `public` and `data` folders have enough access rights:

```sh 
chmod a+rwx data public
```

## Configuration .htaccess

The [`.htaccess`](./onepile/.htaccess) provides some *per-folder-config* for Apache. Please use with care!

### CORS

[CORS](https://developer.mozilla.org/de/docs/Web/HTTP/CORS) is required to be able to access WebDAV from web based OnePile installations like web, Windows, Linux and Android. 

```
Header always set Access-Control-Allow-Origin "*"
Header always set Access-Control-Allow-Methods "*"
Header always set Access-Control-Allow-Headers "*"
Header always set Access-Control-Allow-Credentials "true"
```

## Authentication

This adds the most basic authentication method available. Make sure to adjust the path for `AuthUserFile`. You might want to add with the `htpasswd` command line tool.

```
AuthType Basic
AuthUserFile /full_path_to/.htpasswd
AuthName "Login"
```

It is very important that `OPTIONS` calls are not affected by the authentication in order to make CORS calls work. Therefore the following will enable authentication for all but `OPTIONS` calls:

```
<LimitExcept OPTIONS>
    Require valid-user
</LimitExcept>
```

---

# Apche mod_dav

If the Apache DAV module is available it is of course preferable to use that. To enable CORS you might want to follow this example:

``` 
Alias /dav /var/www/vhosts/webdav.example.de/webdav

<Directory /var/www/vhosts/webdav.example.de/webdav>
    Require all granted
    DAV on
    
    AuthUserFile /var/www/vhosts/webdav.example.de/webdav.passwd
    AuthName WebDAV-Auth
    AuthType Basic
    
    <LimitExcept OPTIONS>
        Require valid-user
    </LimitExcept>
    
    Header always set Access-Control-Allow-Origin "*"
    Header always set Access-Control-Allow-Methods "*"
    Header always set Access-Control-Allow-Headers "*"
    Header always set Access-Control-Expose-Headers "ETag"
    Header always set Access-Control-Allow-Credentials "true"
</Directory>
``` 
