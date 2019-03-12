## What's Sharing

Application to visualize how many housekeeping jobs you and your family have.

You all will feel less burden with this app.

## Version

Rails 5.2.2

Ruby 2.6.1

## Setup

```
$ bin/rails db:migrate
```
Only first time you loanch this app, please run
```
$ bin/rails db:seed
$ bin/rails db:seed RAILS_ENV=test
```
and

```
$ bin/rails server
```

## Test suite

```
$ bundle exec rspec
```
