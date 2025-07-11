# check_duplicate_post_titles.rb
# Scans _posts for duplicate titles (after the date in the filename) and renames them automatically

posts_dir = File.join(__dir__, '..', '_posts')
titles = Hash.new { |h, k| h[k] = [] }

Dir.foreach(posts_dir) do |filename|
  next unless filename.end_with?('.md')
  parts = filename.split('-', 4)
  if parts.length == 4
    title = parts[3].sub(/\.md$/, '')
    titles[title] << filename
  end
end

duplicates = titles.select { |_, files| files.size > 1 }

if duplicates.empty?
  puts 'No duplicate post titles found.'
else
  puts 'Duplicate post titles detected and will be renamed:'
  duplicates.each do |title, files|
    files.each_with_index do |f, idx|
      next if idx == 0 # keep the first file as is
      new_filename = f.sub(/\.md$/, "-#{idx}.md")
      old_path = File.join(posts_dir, f)
      new_path = File.join(posts_dir, new_filename)
      File.rename(old_path, new_path)
      puts "  Renamed '#{f}' to '#{new_filename}'"
    end
  end
end
