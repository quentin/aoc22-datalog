
File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  case line
  when /noop/
    STDOUT.puts "%d $Noop" % [idx]
  when /addx (-?\d+)/
    v = $1
    STDOUT.puts "%d $Addx(%s)" % [idx, v]
  end
end
