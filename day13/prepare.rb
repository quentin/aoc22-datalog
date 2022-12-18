
def scan src
  src.scan(/\[|\]|,|[0-9]+/)
end

def read_value tokens
  return nil if tokens.empty?

  t = tokens.shift
  case t
  when "["
    list = []
    until tokens.first == "]"
      list << read_value(tokens)
      if tokens.first == ","
        tokens.shift
      else
        break
      end
    end
    tokens.shift
    return list
  when /\d+/
    return t.to_i
  end
end

def write_value value
  case value
  when Numeric
    STDOUT.write '$Integer(%i)' % [value]
  when []
    STDOUT.write '$EmptyList'
  when Array
    STDOUT.write '$LinkedList('
    write_value value.shift
    STDOUT.write ','
    write_value value
    STDOUT.write ')'
  end
end

values = []
File.new(ARGV.first, "r").readlines.each_with_index do |line, row|
  line.chomp!
  next if line.empty?
  values << read_value(scan(line))
end

idx = 1
values.each_slice(2) do |left,right|
  STDOUT.write idx
  STDOUT.write "\t"
  write_value(left)
  STDOUT.write "\t"
  write_value(right)
  STDOUT.write "\n"
  idx += 1
end

