brew install postgres postgis

rake db:create
echo "create extension postgis;" | psql -d nypl_hack
rake db:migrate