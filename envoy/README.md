
# [Envoy Proxy](http://envoyproxy.io)


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

### Envoy Proxy may or may not be complimented with [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/envoy-introduction/)

<img width="70%" src="https://d33wubrfki0l68.cloudfront.net/6f74351afb7bf1ae9e614efbed166139ab997430/2c253/docs/latest/images/envoy-ext-authz-flow.png"/>


<img width="70%" src="https://d33wubrfki0l68.cloudfront.net/a5ed0c27ff2dda6abb18b9bc960f2ad4120d937a/a5939/docs/latest/images/kubernetes-admission-flow.png"/>

### [Tutorial: Ingess Validation](https://www.openpolicyagent.org/docs/latest/kubernetes-tutorial/). 
   
<img width="65%" src="https://d33wubrfki0l68.cloudfront.net/53171a3d94dd05f3d4d5554614c763dd1a275d00/3272e/docs/latest/images/kubernetes-watchers.png"/>
