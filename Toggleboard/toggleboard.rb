board = []
for board_y in 0..4
  board.push([])
  for board_x in 0..4
    board[board_y].push(0)
  end
end


def redraw_board(toggle_board)
  for y in 0..3
    for x in 0..3
      toggle_board[y][x].remove
    end
  end
end

def adjacent_tiles(board, y_pos, x_pos)
    board[y_pos][x_pos] = ((board[y_pos][x_pos] - 1)* -1)
    board[y_pos + 1][x_pos] = ((board[y_pos + 1][x_pos] - 1)* -1)
    board[y_pos - 1][x_pos] = ((board[y_pos - 1][x_pos] - 1)* -1)
    board[y_pos][x_pos + 1] = ((board[y_pos][x_pos + 1] - 1)* -1)
    board[y_pos][x_pos - 1] = ((board[y_pos][x_pos - 1] - 1)* -1)
end

def check_if_over(board)
  if board[0..3][0..3].all? {|x| x == array[0]}
    alert("winner")
  end
end

def draw_board(rect_x,rect_y, board)
  # to test board:
  # toggleboard[3][1] = 1

  toggle_board = []
  for board_y in 0..3
    toggle_board.push([])
    for board_x in 0..3
      toggle_board[board_y].push(0)
    end
  end

  for y in 0..3
    for x in 0..3
      toggle_board[y][x] = stack top: rect_y, left: rect_x, width: 20, height: 20 do
        background '00CED1'; unless board[y][x] == 1; background '26466D'; end
        click do
          # gets mouse x/y co-ordinates when a tile is clicked on the opponents board
        |button, mouse_x, mouse_y|
          # converts mouse_x and mouse_y to co-ordinates relevant to the board
          y_pos = (mouse_y / 25) - 1
          x_pos = (mouse_x / 25) - 1

          if y_pos.between?(0, 3) && x_pos.between?(0, 3)
            adjacent_tiles(board, y_pos, x_pos)
            redraw_board(toggle_board)
            draw_board(25, 25, board)
            debug(board)
            #check_if_over(board)
            debug("x: #{x_pos}, y: #{y_pos}")
          end
        end
      end

    # increase x value to draw a column of squares
    rect_x += 25
    end
    # resets x value and creates a new row to draw a column of squares
    rect_x = 25
    rect_y += 25
  end
end


Shoes.app title:"toggleboard", width: 325, height: 300 do
  draw_board(25, 25, board)
end
