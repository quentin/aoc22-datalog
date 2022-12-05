
stacks = Hash.new{|h,k| h[k] = []}
moves = []

File.new(ARGV.first, "r").readlines.each_with_index do |line, idx|
  line.chomp!
  case line
  when /\[/
    line.scan(/(...) ?/).flatten.map{|e| e[1]}.each_with_index do |e, col|
      case e
      when /[A-Z]/
        stacks[col+1].push(e)
      end
    end

  when /move (\d+) from (\d+) to (\d+)/
    count = $1
    from = $2
    to = $3
    moves << [count, from, to]
  end
end

File.open("stacks.facts","w+") do |io|
  stacks.each do |col, elems|
    elems.each_with_index do |elem, row|
      io.puts "%d %d %s" % [col, row, elem]
    end
  end
end

File.open("moves.facts", "w+") do |io|
  moves.each_with_index do |move, idx|
    io.puts "%d %d %d %d" % [idx+1, *move]
  end
end
