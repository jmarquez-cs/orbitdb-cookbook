
### Option 1: Reproduce these certificates using [mkcert](https://github.com/FiloSottile/mkcert#installation) (recommended for development only)
   
1. Install mkcert [pre-built binaries](https://github.com/FiloSottile/mkcert/releases) or commands:
```shell
brew install mkcert
brew install nss    # If using Firefox
```
   
2. Run `mkcert` in the `/certs` directory:
```shell
cd $PWD/../certs
mkcert localhost "*.localhost" localhost 127.0.0.1 ::1
```
- results: 
```console
Note: the local CA is not installed in the system trust store.
Run "mkcert -install" for certificates to be trusted automatically ⚠️

Created a new certificate valid for the following names 📜
 - "localhost"
 - "*.localhost"
   Warning: many browsers don't support second-level wildcards like "*.localhost" ⚠️
 - "localhost"
 - "127.0.0.1"
 - "::1"

Reminder: X.509 wildcards only go one level deep, so this won't match a.b.localhost ℹ️

The certificate is at "./localhost+4.pem" and the key at "./localhost+4-key.pem" ✅

It will expire on 5 November 2023 🗓
```

3. From this directory, concatenate keys and root CA into a `fullchain.pem` file
```shell
mkcert -CAROOT                # prints location of rootCA
cd $(mkcert -CAROOT)          # cd to this location
sudo cp rootCA-key.pem ~/path/to/this/orbit/certs/rootCA-key.pem
sudo cp rootCA.pem ~/path/to/this/orbit/certs/rootCA.pem
cat localhost+4.pem rootCA.pem localhost+4-key.pem > fullchain.pem
```
   
### Option 2: [Certbot](https://certbot.eff.org/lets-encrypt/osx-haproxy)
   
1. Open terminal and install certbot using the following command:
```shell
brew install certbot
```
   
2. Next, Certbot will temporarily spin up a webserver on your machine.Spins up a daemon using the following command:
```shell
sudo certbot certonly --standalone
```
   
3. Set up automatic renewal with a cron job to `/etc/crontab`
```shell
echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
```
   
- Test automatic renewal set up with the following command:
```shell
sudo certbot renew --dry-run
```
   
4. Move cert and key to this path `orbitdb-cookbook/certs`