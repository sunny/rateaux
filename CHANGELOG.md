## unreleased

## v2.1.0

Dependencies:
- Drop support for Ruby < 3.2

Features:
- Add `rake i18n:word_count` task.
- Add `rake db:migrate:delete_orphaned` task.

Fix:
- Use default database connection for `rake db:schema:view` task.
- Ignore `db/schema.rb` in `rake add_frozen_string_literal_headers` task.

## v2.0.0

Breaking changes:
- Remove `rake encoding_headers` (only useful before Ruby 2).
- Rename `rake cache_clear` to `rake cache:clear`.

Features:
- Add `rake add_frozen_string_literal_headers` task.
- Add `rake sidekiq:flush` task.

Fix:
- Force cascade deletion to `rake db:drop_tables`.

## v1.6.0

First CHANGELOG entry.
