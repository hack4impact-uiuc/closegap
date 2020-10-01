#!/usr/bin/env bash

ROOT=$(git rev-parse --show-toplevel)

while true; do
    read -p "Seed database with initial data? [Y/n] " yn
    case $yn in
        "" | [Yy]* ) SUFFIX="_seeded"; break;;
        [Nn]* ) SUFFIX=""; break;;
        * ) echo "Please answer y or n.";;
    esac
done

createuser -d closegap-api

createdb -U closegap-api closegap-api_development
createdb -U closegap-api closegap-api_test

psql closegap-api_development < ${ROOT}/api/schema/db/development${SUFFIX}.sql
psql closegap-api_test < ${ROOT}/api/schema/db/test${SUFFIX}.sql
