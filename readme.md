# Usage

```
./inspect_cache.sh --cache-path "/home/fastcgicache_wp/yourdomaincom"
```

For Centmin Mod LEMP stack with PHP-FPM fastcgi_cache with:

```
fastcgi_cache_key       "$scheme$request_method$host$request_uri$http_accept_encoding";
```

Inspecting fastcgi_cache_path `/home/fastcgicache_wp/domaincom`

```
./inspect-fastcgi-cache.sh --cache-path /home/fastcgicache_wp/domaincom
===================================
-rw------- 1 nginx nginx 75K Aug 11 09:39 /home/fastcgicache_wp/domaincom/0/10/a49f738656cec91085332f8147512100
-----------------------------------
Contents:
a�d����������d
KEY: httpsGETdomain.com/tag/pagespeed/gzip
Content-Type: text/html; charset=UTF-8
X-UA-Compatible: IE=edge
Link: <https://domain.com/wp-json/>; rel="https://api.w.org/"
Link: <https://domain.com/wp-json/wp/v2/tags/47>; rel="alternate"; type="application/json"

===================================
-rw------- 1 nginx nginx 69K Aug 11 09:39 /home/fastcgicache_wp/domaincom/4/f4/52c7dcd0f913a6eb989c250725765f44
-----------------------------------
Contents:
b�d����������dE
KEY: httpsGETdomain.com/tag/sxg/gzip
Content-Type: text/html; charset=UTF-8
X-UA-Compatible: IE=edge
Link: <https://domain.com/wp-json/>; rel="https://api.w.org/"
Link: <https://domain.com/wp-json/wp/v2/tags/79>; rel="alternate"; type="application/json"
```