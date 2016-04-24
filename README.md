Automated build of Varnish with Docker
===========

### Use the pre built image
The pre built image can be downloaded using docker directly. After that you do not need to use this command again, you will have the image on your machine.

```
$ docker pull Natsui31/varnish
```

### Usage
The container has all pre requisites set up to run any varnish application. 

```
docker run -d \ 
  -p 80:80 \
  --link web-app:backend-host \
  Natsui31/varnish
```

In the above example we assume that:
* You have your application running inside `web-app` container and web server there is running on port 80 (although you don't need to expose that port, as we use --link and varnish will connect directly to it)
* `web-app` is aliased inside varnish container as `backend-host`
* Expose port 80

### Environment variables
You can configure Varnish daemon by following env variables:

> **VCL_CONFIG** `/etc/varnish/default.vcl`  
> **CACHE_SIZE** `64m`  
> **VARNISHD_PARAMS** `-p default_ttl=3600 -p default_grace=3600`
