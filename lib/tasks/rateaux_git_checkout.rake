# encoding: UTF-8
#
# Remove migrations then checkout a git branch
#
#     $ rake checkout new_branch_name
#
# Via https://gist.github.com/jonlemmon/4076864
#
# 1. Roll back any migrations on your current branch which do not exist on the
#    other branch
# 2. Discard any changes to the db/schema.rb file
# 3. Check out the other branch
# 4. Run any new migrations existing in the other branch
# 5. Update your test database

desc "Switch git branches and apply migrations"
task "checkout" do

  # We can't checkout if we're dirty
  unless `git diff --shortstat`.blank?
    $stderr.puts "error: Your local changes would be overwritten by checkout."
    $stderr.puts "Please, commit your changes or stash them before you can switch branches."
    abort "Aborting"
  end

  # Last argument trick
  # Via http://itshouldbeuseful.wordpress.com/2011/11/07/passing-parameters-to-a-rake-task/
  task ARGV.last do ; end
  branch_name = ARGV.last

  # List migrations
  changes = `git diff #{branch_name} --name-status`.lines
  migrations = changes.map { |change|
    match = /^A.*migrate\/([0-9]+)/.match(change)
    match ? match[1] : nil
  }.compact

  # Drop it like it's hot
  migrations.sort.reverse.each do |migration|
    # TODO we're already in rake, we should call these tasks directly
    sh "bundle exec rake db:migrate:down VERSION=#{migration}"
  end

  # Switch
  sh "git checkout db/schema.rb"
  sh "git checkout #{branch_name}"
  sh "bundle exec rake db:migrate"
  sh "bundle exec rake db:test:prepare"
end
