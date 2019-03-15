## What's Sharing

Application to visualize how many housekeeping jobs you and your family have.

You all will feel less burden with this app.

[![Image from Gyazo](https://i.gyazo.com/824deb169a37756335085df2b822c845.png)](https://gyazo.com/824deb169a37756335085df2b822c845)

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

## Check codes

````
$ bundle exec rubocop
```

```
$ slim-lint
```

## Test suite

```
$ bundle exec rspec
```
