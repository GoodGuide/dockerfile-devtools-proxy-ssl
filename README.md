This sets up an insecure Nginx proxy with configurable upstream, generating a
self-signed SSL certificate at runtime. The intent is to proxy with SSL during
development for certain apps that enforce using SSL.

Run it like so:

```bash
docker run --rm -e PROXY_TO_URI='http://ADDRESS:3000' -p 8080:443 goodguide/devtools-proxy-ssl
```

Where `ADDRESS` is an IP or hostname reachable from the docker environment,
pointing to the app in question.

After that, hit `https://docker-address:8080` in a browser and ackowledge the
insecure cert warning, then it should be smooth sailing.
