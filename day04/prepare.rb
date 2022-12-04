
File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  m = /(\d+)-(\d+),(\d+)-(\d+)/.match(line)
  STDOUT.puts "%d %s %s %s %s" % [idx,m[1],m[2],m[3],m[4]]
end
