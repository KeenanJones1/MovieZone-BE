# The Movie Zone (back-end)

A dynamic movie app that receives data from an external RapidApi and an internal API built with Ruby on Rails and saves to local storage.

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
 rvm use 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle install
```

### Initialize the database

```shell
rails db:setup db:migrate db:seed
```

## Serve

```shell
rails s -p 3000
```

# Check if PostgreSQL is installed

postgres -V

- bash: postgres: command not found

# Install PostgreSQL via Homebrew

brew install postgresql
postgres -V

### postgres (PostgreSQL) 11.3
