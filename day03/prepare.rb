
File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  STDOUT.puts "%d %s" % [idx, line]
end
