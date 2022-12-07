
File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  case line
  when /^\$ cd (.+)/
    dir = $1
    STDOUT.puts '%d,"$cd(""%s"")"' % [idx, dir, line]
  when /^\$ ls/
    STDOUT.puts '%d,"$ls"' % [idx]
  when /^dir (.+)/
    dir = $1
    STDOUT.puts '%d,"$dir(""%s"")"' % [idx, dir]
  when /^([0-9]+) (.+)/
    size = $1
    file = $2
    STDOUT.puts '%d,"$file(""%s"",%d)"' % [idx, file, size]
  end
end
