Realtime
========


In order to have a functional realtime on your server you need to :
 - update your /etc/hosts and point on the `reverse-proxy` and not `tuleap-web_1`
 - get your private key by launching `head -c 64 /dev/urandom | base64`
 - update /etc/tuleap-realtime/config.json with the generated key (key nodejs_server_jwt_private_key)
 - update the local.inc file configuration with following settings:
     $nodejs_server = 'tuleap-web.tuleap-aio-dev.docker:443';
     $nodejs_server_int = 'realtime';
     $nodejs_server_jwt_private_key = '<your_private_key>'
- docker restart tuleap_realtime_1


And it should be all.
If something goes wrong you can check the log of the realtime server with `docker logs tuleap_realtime_1`