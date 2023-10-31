import requests
url = "https://www.google.com/"

hearders = {"Authorization": "Bearer {}".format(bearer_token)}
r = requests.get(url,verify=False,headers=hearders)

import urllib2
urllib2.Request(url,None,{"Authorization":"Bearer {}".format(access_token)})