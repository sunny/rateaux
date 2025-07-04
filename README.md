# Rateaux

This is a collection of useful Rake tasks for Ruby on Rails applications.

![Photo of an old wooden Rake on top of hay](https://github.com/user-attachments/assets/a1549ae8-a20f-4c87-a634-4298223bbb6e)

_[Hay Rake](https://www.flickr.com/photos/49708076@N05/23047850374/) photo by Larry Lamb_

## Install

Add these lines to your app's Gemfile:

```ruby
# Rake tasks for Rails
gem "rateaux"
```

Then call `bundle install`.


## Tasks

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

### DB Migrate Delete Orphaned

When your migration errors with "No migration with version number" you can call
this to delete all migrations that don’t have associated files anymore.

```sh
$ rake db:migrate:delete_orphaned
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

### Sidekiq flush

Empty Sidekiq’s queues.

```sh
$ rake sidekiq:flush
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

### Frozen string literal

Add the `# frozen_string_literal: true` header to all Ruby files in the project.

```sh
$ rake add_frozen_string_literal_headers
```

## The name

In French _rateaux_ means _rakes_.
