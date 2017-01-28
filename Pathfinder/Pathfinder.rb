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
table.each do |n|
  puts n.each {|p| p }.join(' ')
end


x_pos = 0
y_pos = 0

def number_of_paths(table, x_pos, y_pos, max_rows, max_cols)
  return 1 if x_pos == max_cols && y_pos == max_rows
  return 0 if x_pos > max_cols || y_pos > max_rows || table[y_pos][x_pos] != 1
  return number_of_paths(table, x_pos, y_pos + 1, table.length - 1, table[0].length - 1) + number_of_paths(table, x_pos + 1, y_pos, table.length - 1, table[0].length - 1)
end


#table.each_slice(rows/columns) {|x| print x.join, ("\r\n")}
print number_of_paths(table, x_pos, y_pos, table.length - 1, table[0].length - 1)