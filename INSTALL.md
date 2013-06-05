# Installing

The app contains a lot of hard-coded URLs, so these instructions
likely won't work without a small amount of further work in the
codebase.

You'll need to [register a Foursquare app][foursq_app_reg]. Ensure
that **Push API Notifications** are enabled, set your **Redirect URI**
to the `/register_callback` route and that your **Push url** is set
to the `/checkin` route. **Web Connect Support** should be turned on,
too, so that Foursquare accounts can properly be connected to the app.

[foursq_app_reg]: https://foursquare.com/developers/apps

```
git clone git://github.com/thejefflarson/nypl-hack.git
cd nypl-hack

# on Mac OS X
brew install postgres postgis

bundle install
rake db:create
echo "create extension postgis;" | psql -d nypl_hack
rake db:migrate
rake data:load
```

Make sure `FOURSQ_CLIENT_ID` and `FOURSQ_CLIENT_SECRET` are set in
your environment when you launch the server (rails or when you
use passenger/unicorn/etc)

```
export FOURSQ_CLIENT_ID="abcde..."
export FOURSQ_CLIENT_SECRET="abcde..."

#...or when you launch unicorn or "rails server"...
FOURSQ_CLIENT_ID="abcde..." \
FOURSQ_CLIENT_SECRET="abcde..." \
rails s
# or
FOURSQ_CLIENT_ID="abcde..." \
FOURSQ_CLIENT_SECRET="abcde..." \
unicorn_rails -c config/unicorn.rb -D -E production
```
