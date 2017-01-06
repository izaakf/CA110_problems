# Made By Zak Freeman

def create_table(rows, columns)
  possible_ints = [0, 1, 2, 3, 4, 1]
  $table = Array.new(rows, Array.new(columns, 0))
end

def number_of_paths(rows, columns)
  x_pos = 0
  y_pos = 0

  until y_pos == rows && x_pos == columns
    $table[y_pos][x_pos] = '.'
    $table.each_slice(columns) {|x| print x.join, ("\n")}
    if $table[y_pos][x_pos + 1] == 0
      $table[y_pos][x_pos] = 0
      x_pos += 1
    elsif $table[y_pos + 1] == 0 || $table[y_pos][x_pos + 1].nil?
      $table[y_pos][x_pos] = 0
      y_pos += 1
    else
      puts "can't move"
      break
    end
    gets
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end
print 'Width: '
columns = gets.chomp.to_i
print 'Height: '
rows = gets.chomp.to_i

p columns, rows
create_table(rows, columns)
number_of_paths(rows, columns)