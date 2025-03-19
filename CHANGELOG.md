## unreleased

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
