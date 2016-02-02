require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    b1 = ["..9748...","7........",".2.1.9...","..7...24.",".64.1.59.",".98...3..","...8.3.2.","........6","...2759.."]
    r1 = ["519748632","783652419","426139875","357986241","264317598","198524367","975863124","832491756","641275983"]
    solve_sudoku(b1)
    assert_equal r1, b1
  end
end


# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  do_sudoku(board)
end

def do_sudoku(board)
  for i in (0..8)
    for j in (0..8)
      if board[i][j] == '.'
        for k in (1..9) do
          board[i][j] = k.to_s
          if is_valid(board, i, j) && do_sudoku(board)
            return true
          end
          board[i][j] = '.'
        end
        return false
      end
    end
  end
  return true
end

def is_valid(board, x, y)

  for i in (0..8) do
    if i != x && board[i][y] == board[x][y]
      return false
    end
  end

  for j in (0..8) do
    if j != y && board[x][j] == board[x][y]
      return false
    end
  end


  a = x / 3 * 3
  b = y / 3 * 3

  for m in (a..a+2)
    for n in (b..b+2)
      if (m != x || n != y) && board[m][n] == board[x][y]
        return false
      end
    end
  end

  return true
end
