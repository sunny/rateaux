# encoding: UTF-8
#
# Copy all assets to their non-digested form.
#
# Via https://github.com/rails/sprockets-rails/issues/49#issuecomment-20535134

namespace :assets do

  desc "Copy non digested assets"
  task copy_non_digested: :environment do
    assets = Dir.glob(File.join(Rails.root, 'public/assets/**/*'))
    regex = /(-{1}[a-z0-9]{32}*\.{1}){1}/
    assets.each do |file|
      next if File.directory?(file) || file !~ regex

      source = file.split('/')
      source.push(source.pop.gsub(regex, '.'))

      non_digested = File.join(source)
      FileUtils.cp(file, non_digested)
    end
  end

end
