# Made By Zak Freeman

print 'Width: '
columns = gets.chomp.to_i
print 'Height: '
rows = gets.chomp.to_i

possible_ints = [1, 1, 1, 1, 1, 1, 1, 1, 1]
#possible_ints = [*?0..?9]
table = Array.new
rows.times do |x|
  table.push([])
  columns.times do
    table[x].push(possible_ints.sample)
  end
end
table[rows - 1][columns - 1] = 1
table.each_slice(rows/columns) {|x| print x.join, ("\n")}

x_pos = 0
y_pos = 0

def number_of_paths(table, x_pos, y_pos)
  print "#{x_pos},#{y_pos}\n"
  return if x_pos == table[0].length - 1 && y_pos == table.length - 1
  if y_pos < table.length - 1
    y_pos += 1
  else
    x_pos += 1
  end
  number_of_paths(table, x_pos, y_pos)
end


#table.each_slice(rows/columns) {|x| print x.join, ("\r\n")}
number_of_paths(table, x_pos, y_pos)