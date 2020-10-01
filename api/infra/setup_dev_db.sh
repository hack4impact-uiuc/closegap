#!/usr/bin/env bash

# Get root path of Git repo
ROOT=$(git rev-parse --show-toplevel)

# Ask user if they want to seed the database with initial data
while true; do
    read -p "Seed database with initial data? [Y/n] " yn
    case $yn in
        "" | [Yy]* ) SUFFIX="_seeded"; break;;
        [Nn]* ) SUFFIX=""; break;;
        * ) echo "Please answer y or n.";;
    esac
done

# Create user closegap-api, which will be the API's DB user
createuser -d closegap-api

# Create development and test DBs
createdb -U closegap-api closegap-api_development
createdb -U closegap-api closegap-api_test

# Run the SQL schemas.
# schema/db/development_seeded.sql for schema of seeded DB
# schema/db/development.sql for schema of bare DB
psql closegap-api_development < ${ROOT}/api/schema/db/development${SUFFIX}.sql
psql closegap-api_test < ${ROOT}/api/schema/db/test${SUFFIX}.sql
