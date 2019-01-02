library(twitteR)
library(ROAuth)

#
consumer_key = "k3ibVblOlMAA7LfwvWpd5889q"
consumer_secret = "lRtIyY5aSyZ6QowJphkysDgs2n3hUhlZwL8JP61VLMifDi5rrn"
access_token = "389957567-m9R1EfBPC54YkXCWgQ5WkhgbrkGWljO4W9QqNuCi"
access_secret = "IsceFUqFxVuhBUYryLc2XZPXZa4zjpMPQ8x0fhtq716iL"

download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'


setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

Cred <- OAuthFactory$new(consumerKey=consumer_key,
                         consumerSecret=consumer_secret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
Cred$handshake(cainfo =  'cacert.pem') 

#save setting
save(Cred, file='twitter authentication.Rdata')

#load setting
load('twitter authentication.Rdata') 
