# encoding: UTF-8
#
# Add 'encoding: UTF-8' to all files
#
#     $ rake encoding_headers

desc "Adds the frozen_string_literal header to all Ruby files"
task frozen_string_headers: :environment do
  files = []
  ["*.rb", "*.rake"].each do |extension|
    files.concat(Dir[File.join(Dir.getwd.split(/\\/), "**", extension)])
  end

  encoding = "# frozen_string_literal: true\n"

  files.each do |file|
    content = File.read(file)
    next if content[0..encoding.length] == encoding
    content = content.gsub(/^# (frozen_string_literal: true)\n/i, "")
    new_file = File.open(file, "w")
    new_file.write(encoding+content)
    new_file.close
  end
end
