# Rateaux

This is a collection of usefull Rake tasks for Rails.

## Install

Add this line to your Gemfile to install it with Bundler:

```ruby
gem "rateaux"
```

Then type `bundle install` in a terminal.

## Rake Tasks

### Truncate

Truncate all data from the current SQL database.

```sh
$ rake db:truncate
```

### Encoding headers

Add the `# encoding: UTF-8` header to all ruby files in the project.

```sh
$ rake encoding_headers
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
