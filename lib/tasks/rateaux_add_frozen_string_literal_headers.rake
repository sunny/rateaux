# frozen_string_literal: true

# Adds "frozen_string_literal: true" to the top of all Ruby files.
#
#     $ rake add_frozen_string_literal_headers

desc "Adds the frozen_string_literal header to all Ruby files"
task add_frozen_string_literal_headers: :environment do
  files = []
  ["*.rb", "*.rake"].each do |extension|
    files.concat(Dir[File.join(Dir.getwd.split(/\\/), "**", extension)])
  end

  header = "# frozen_string_literal: true\n"

  files.each do |file|
    content = File.read(file)
    next if content[0..header.length] == header

    content = content.gsub(/^# (frozen_string_literal: true)\n/i, "")
    content = "#{header}#{content}"

    new_file = File.open(file, "w")
    new_file.write(content)
    new_file.close
  end
end
