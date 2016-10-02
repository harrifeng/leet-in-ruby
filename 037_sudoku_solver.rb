require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_037
    pa1 = ['..9748...', '7........', '.2.1.9...', '..7...24.',
           '.64.1.59.', '.98...3..', '...8.3.2.', '........6', '...2759..']
    a1 = []
    pa1.each do |p|
      a1.push(p.split(''))
    end

    pr1 = %w(519748632 783652419 426139875 357986241
             264317598 198524367 975863124 832491756 641275983)
    r1 = []
    pr1.each do |p|
      r1.push(p.split(''))
    end
    solve_sudoku(a1)
    assert_equal r1, a1
  end
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  dfs(board)
end

def board_valid?(board, x, y)
  tmp = board[x][y]
  board[x][y] = 'D'
  9.times do |i|
    return false if (board[i][y] == tmp) || (board[x][i] == tmp)
  end

  3.times do |i|
    3.times do |j|
      return false if board[(x / 3) * 3 + i][(y / 3) * 3 + j] == tmp
    end
  end
  board[x][y] = tmp
  true
end

def dfs(board)
  9.times.each do |i|
    9.times.each do |j|
      if board[i][j] == '.'
        '123456789'.each_char do |c|
          board[i][j] = c
          return true if board_valid?(board, i, j) && dfs(board)
          board[i][j] = '.'
        end
        return false
      end
    end
  end
  true
end
