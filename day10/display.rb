require 'readline'
# requires ruby 3.2

Pixel = Data.define(:row, :col, :is_lit)

pixels = []
File.new("pixel.csv", "r").each_line do |line|
  line.chomp!
  tuple = line.split("\t").map{|e| e.to_i}
  pixels << Pixel.new(*tuple)
end

for row in 0..5
  for col in 0..39
    pixel = pixels.find{|pixel| pixel.row == row && pixel.col == col}
    lit = (pixel.is_lit != 0)
    STDOUT.write (lit ? "#" : " ")
  end
  STDOUT.puts
end
