#!/bin/sh

ROOT=$(git rev-parse --show-toplevel)

while true; do
    read -p "Seed database with initial data? [Y/n] " yn
    case $yn in
        "" ) SUFFIX="_seeded"; break;;
        [Yy]* ) SUFFIX="_seeded"; break;;
        [Nn]* ) SUFFIX=""; break;;
        * ) echo "Please answer y or n.";;
    esac
done

createuser -d closegap-api

createdb -U closegap-api closegap-api_development
createdb -U closegap-api closegap-api_test

psql closegap-api_development < ${ROOT}/api/schema/db/development${SEEDED}.sql
psql closegap-api_test < ${ROOT}/api/schema/db/test${SEEDED}.sql
