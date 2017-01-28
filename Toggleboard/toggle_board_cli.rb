# Made by Zak Freeman

game_over = false
print "input your board height: "
board_height = gets.chomp.to_i
print "input your board width: "
board_width = gets.chomp.to_i
board = []

for y in 0..board_height-1
  board.push([])
  for x in 0..board_width-1
    board[y].push(0)
  end
end

def shoot
  print "\r\nRow? "
  tile_y = gets.chomp.to_i
  print "Column? "
  tile_x = gets.chomp.to_i
  toggle_tiles(tile_y, tile_x, board)
end

def toggle_tiles(tile_y, tile_x, board)
  board[tile_y][tile_x] = ((board[tile_y][tile_x] - 1)* -1)
  unless tile_y == 0 || tile_x == 0 || tile_y == board.length - 1 || tile_x == board[0].length - 1
    board[tile_y + 1][tile_x] -= 1; board[tile_y + 1][tile_x] *= -1
    board[tile_y - 1][tile_x] -= 1; board[tile_y - 1][tile_x] *= -1
    board[tile_y][tile_x + 1] -= 1; board[tile_y][tile_x + 1] *= -1
    board[tile_y][tile_x - 1] -= 1; board[tile_y][tile_x - 1] *= -1
  end
  if tile_y == board.last
    board[tile_y - 1][tile_x] = ((board[tile_y - 1][tile_x] - 1)* -1)
  end
end

until game_over do
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts "current board: "
  board.each_with_index { |x| puts "#{x}" }
  shoot
end
