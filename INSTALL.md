# Installing
to do.

```
sh boot.sh
```


Make sure `FOURSQ_CLIENT_ID` and `FOURSQ_CLIENT_SECRET` are set in your environment.

```
export FOURSQ_CLIENT_ID="abcde..."
export FOURSQ_CLIENT_SECRET="abcde..."

#...or when you launch unicorn or etc...
FOURSQ_CLIENT_ID="abcde..."\
FOURSQ_CLIENT_SECRET="abcde..."\
unicorn_rails -c config/unicorn.rb -D -E production
```

