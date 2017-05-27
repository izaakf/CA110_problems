# Made by Zak Freeman

print "input your board height: "
board_height = gets.chomp.to_i
print "input your board width: "
board_width = gets.chomp.to_i

board = []

for y in 0..board_height-1
  board.push([])
  board_width.times{board[y].push(0)}
end

def print_x(board, score)
  print score * 2
  board[0].each_index{|i| print i, score}
  print "#{score}\r\n"
end

def print_y(board)
  board.each_with_index{|n, i| puts i.to_s + '|' + n.each {|p| p }.join(' ') + '|' + i.to_s}
end

def print_board(board)
  print_x(board, '_')
  print_y(board)
  print_x(board, '‾')
end

def shoot(board)
  print "\r\nColumn? "
  tile_x = gets.chomp.to_i
  print "Row? "
  tile_y = gets.chomp.to_i
  begin
    toggle_tiles(tile_y, tile_x, board)
  rescue
    Gem.win_platform? ? (system "cls") : (system "clear")
    print "(#{tile_x}, #{tile_y}) out of bounds"
    sleep(2)
  end
end

def toggle_tiles(tile_y, tile_x, board)
  board[tile_y][tile_x] = ((board[tile_y][tile_x] - 1)* -1)

  if tile_y == 0
    board[tile_y + 1][tile_x] = ((board[tile_y + 1][tile_x] - 1)* -1)
  elsif tile_y == board.length - 1
    board[tile_y - 1][tile_x] = ((board[tile_y - 1][tile_x] - 1)* -1)
  else
    board[tile_y + 1][tile_x] = ((board[tile_y + 1][tile_x] - 1)* -1)
    board[tile_y - 1][tile_x] = ((board[tile_y - 1][tile_x] - 1)* -1)
  end

  if tile_x == 0
    board[tile_y][tile_x + 1] = ((board[tile_y][tile_x + 1] - 1)* -1)
  elsif tile_x == board[tile_y].length - 1
    board[tile_y][tile_x - 1] = ((board[tile_y][tile_x - 1] - 1)* -1)
  else
    board[tile_y][tile_x - 1] = ((board[tile_y][tile_x - 1] - 1)* -1)
    board[tile_y][tile_x + 1] = ((board[tile_y][tile_x + 1] - 1)* -1)
  end
end

while true
  Gem.win_platform? ? (system "cls") : (system "clear")

  if board.flatten.all? {|x| x == 1}
    puts "COMPLETE!"
    print_board(board)
    break
  end

  puts "current board: "
  print_board(board)
  shoot(board)
end