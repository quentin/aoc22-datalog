
File.new(ARGV.first, "r").readlines.each_with_index do |line, row|
  line.chomp!
  line.scan(/./).each_with_index do |cell, col|
    start = (cell == "S")
    best = (cell == "E")
    if start
      height = 0
    elsif best
      height = 25
    else
      height = cell.ord - "a".ord
    end
    # row col height is_start is_best
    STDOUT.puts "%i %i %i %i %i" % [row, col, height, (start ? 1 : 0), (best ? 1 : 0)]
  end
end
