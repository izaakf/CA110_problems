# Made By Zak Freeman

print 'Width: '
columns = gets.chomp.to_i
print 'Height: '
rows = gets.chomp.to_i

possible_ints = [1, 1, 1, 1, 1, 1, 1, 1, 1]
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

def number_of_paths(table, x_pos, y_pos)
  return print 'maze solved' if x_pos == table[0].length - 1 && y_pos == table.length - 1
  if y_pos < table.length - 1 && table[y_pos+1][x_pos] == 1
    y_pos += 1
  elsif x_pos <table[y_pos].length - 1 && table[y_pos][x_pos + 1] == 1
    x_pos += 1
  else
    return print 'maze cannot be solved'
  end
  number_of_paths(table, x_pos, y_pos)
end

number_of_paths(table, x_pos, y_pos)