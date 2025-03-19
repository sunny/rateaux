# Rateaux

This is a collection of useful Rake tasks for Rails.


## Install

Add these line to your app's Gemfile:

```ruby
# Rake tasks for Rails
gem "rateaux"
```

Then call `bundle install`.


## Rake Tasks

### DB Truncate

Delete all data from the current database.

```sh
$ rake db:truncate
```

### DB Drop tables

Delete all data and tables from the current database. This is similar to
`db:drop` but it does not drop the database itself.

```sh
$ rake db:drop_tables
```

### Checkout

Remove migrations then checkout a git branch.

```sh
$ rake checkout new_branch_name
```

This will:

1. Roll back any migrations on your current branch which do not exist on the
   other branch
2. Discard any changes to the db/schema.rb file
3. Check out the other branch
4. Run any new migrations existing in the other branch
5. Update your test database

### Cache clear

Empty the Rails cache store.

```sh
$ rake cache:clear
```

### Assets Copy Non Digested

Copy assets files with a digest (for example `application-d45e…565.css`)
to their non-digested form (for example `application.css`).

```sh
$ rake assets:copy_non_digested
```

### DB schema view

View the database structure.

```sh
$ rake db:schema:view
```
