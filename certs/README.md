### Option 1: MacOS Steps for SSL/TLS using [Certbot](https://certbot.eff.org/lets-encrypt/osx-haproxy)

1. Open terminal and install certbot using the following command:
```shell
$ brew install certbot
```
   
2. Next, Certbot will temporarily spin up a webserver on your machine.Spins up a daemon using the following command:
```shell
$ sudo certbot certonly --standalone
```

3. Set up automatic renewal with a cron job to `/etc/crontab`
```shell
echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
```
   
- Test automatic renewal set up with the following command:
```shell
sudo certbot renew --dry-run
```
   

Option 2: [mkcert](https://github.com/FiloSottile/mkcert#installation)   
   
1. Install mkcert [pre-built binaries](https://github.com/FiloSottile/mkcert/releases) or commands:
```shell
brew install mkcert
brew install nss    # If using Firefox
```
   
2. Run `mkcert` in the `/certs` directory:
```shell
cd $PWD/../certs
mkcert localhost "*.localhost" localhost 120.0.0.1 ::1
```
results: 
```console
Note: the local CA is not installed in the system trust store.
Run "mkcert -install" for certificates to be trusted automatically ⚠️

Created a new certificate valid for the following names 📜
 - "localhost"
 - "*.localhost"
   Warning: many browsers don't support second-level wildcards like "*.localhost" ⚠️
 - "localhost"
 - "120.0.0.1"
 - "::1"

Reminder: X.509 wildcards only go one level deep, so this won't match a.b.localhost ℹ️

The certificate is at "./localhost+4.pem" and the key at "./localhost+4-key.pem" ✅

It will expire on 5 November 2023 🗓