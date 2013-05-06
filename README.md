Announce
--------

Announce new tags in your repos.

Deployment
----------

run:

```
heroku create new-announcer
heroku config:set \
    BASIC_USERNAME="basic auth username" \
    BASIC_PASSWORD="basic auth password" \
    TWITTER_USERNAME="twitter account username" \
    TWITTER_PASSWORD="twitter account password"

git push heroku master
```

Register a new hook with your repo at `https://my-new-boxen.herokuapp.com`
