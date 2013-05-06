Announce
--------

Announce new tags in your repos.

Deployment
----------

* Create a twitter account
* Register a [new twitter app](https://dev.twitter.com)
* Set the permissions to read/write
* Generate a personal key for your account

substituting for your new settings, run:

```
heroku create new-announcer
heroku config:set \
    BASIC_USERNAME="basic auth username" \
    BASIC_PASSWORD="basic auth password" \
    TWITTER_TOKEN="twitter oauth token" \
    TWITTER_TOKEN_SECRET="twitter oauth secret token" \
    TWITTER_CONSUMER_KEY="twitter consumer key" \
    TWITTER_CONSUMER_SECRET="twitter consumer secret"

git push heroku master
```

Register a new hook with your repo at `https://basic_username:basic_password@new-announcer.herokuapp.com`

What does it looks like?
------------------------

Check out the [demo account](https://twitter.com/AnnounceTest)

TODOs
-----

* tests
* travis-ci
* a better name
