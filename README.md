Announce
--------

Announce new tags in your repos.

Deployment
----------

run:

```
heroku create new-announcer
heroku config:set \
    USERNAME="basic auth username" \
    PASSWORD="basic auth password"

git push heroku master
```

Register a new hook with your repo at `https://my-new-boxen.herokuapp.com`
