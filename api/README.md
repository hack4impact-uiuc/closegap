# Closegap API

This folder contains the backend api of the application.

## Setup DB

### Install PostgreSQL

#### macOS

1. Install [Homebrew](https://brew.sh).

2. Install postgresql via Homebrew.

   `$ brew install postgresql`

3. Start postgresql and register it to launch on system start.

   `$ brew services start postgresql`

#### Windows Subsystem for Linux (WSL)

1. [Install postgresql.](https://github.com/michaeltreat/Windows-Subsystem-For-Linux-Setup-Guide/blob/master/readmes/installs/PostgreSQL.md)

2. Start postgresql.

   `$ sudo service postgresql start `

### Create database

Run setup script. Enter `n` if you do not wish to seed with initial data.

```
$ infra/setup_dev_db.sh
Seed database with initial data? [Y/n] y
...
```

## Configure App

```
$ cp config/dev.env.default config/dev.env
```

## Install & Run

```bash
yarn && yarn start
```

## Test DB access

```
$ curl http://localhost:5000/students/1
{"data":{"id":"1","user_id":"1","first_name":"Ipsum1","middle_name":"Lorem1","last_name":"Dolor1","birthdate":"2010-11-14T06:00:00.000Z","homeroom_teacher":"Amet1","grade":"1st","gender":"male","created_at":"2020-10-01T09:31:50.910Z","updated_at":"2020-10-01T09:31:50.976Z","school_name":"some school name"}}% 
```

