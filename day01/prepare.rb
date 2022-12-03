
File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  if line.empty?
    STDOUT.puts "%d 1 0" % [idx]
  else
    m = line.match(/\d+/)
    STDOUT.puts "%d 0 %d" % [idx,m[0]]
  end
end
