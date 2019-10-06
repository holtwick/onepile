# WebDAV Sample Installation

A very widely used and open protocol for file storage is WebDAV. It is also a simple way to provide sync infrastructure on existing web servers.

This is an example how to enable WebDAV on your simple web hosting that supports PHP. It is a sample installation of [Sabre/DAV](http://sabre.io/dav/install/).

## CORS

If you run Apache you might want to add this to a `.htaccess` file placed in the root directory of your WebDAV installation, but **do it on your own risk! **

```
Header set Access-Control-Allow-Origin "*"
Header set Access-Control-Allow-Methods "*"
Header set Access-Control-Allow-Headers "*"
```

