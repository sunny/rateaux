# encoding: UTF-8
#
# Add 'encoding: UTF-8' to all files
#
#     $ rake encoding_headers

desc "Adds the missing utf-8 encoding header on all Ruby files"
task :encoding_headers => :environment do
  files = []
  ["*.rb", "*.rake"].each do |extension|
    files.concat(Dir[ File.join(Dir.getwd.split(/\\/), "**", extension) ])
  end

  encoding = "# encoding: UTF-8\n"

  files.each do |file|
    content = File.read(file)
    next if content[0..encoding.length] == encoding
    content = content.gsub(/^# (encoding: UTF-8|coding: UTF-8|-*- coding: UTF-8 -*-)\n/i, "")
    new_file = File.open(file, "w")
    new_file.write(encoding+content)
    new_file.close
  end
end

