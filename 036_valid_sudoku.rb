# coding: utf-8
require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_036
    assert is_valid_sudoku(['.87654321',
                            '2........',
                            '3........',
                            '4........',
                            '5........',
                            '6........',
                            '7........',
                            '8........',
                            '9........'])
  end
end

def is_valid_sudoku(board)
  row = Array.new(9) { Array.new(9, false) }
  col = Array.new(9) { Array.new(9, false) }
  grp = Array.new(9) { Array.new(9, false) }

  9.times do |i|
    9.times do |j|
      next unless board[i][j] != '.'
      cur = board[i][j].to_i - 1
      return false if row[i][cur] || col[j][cur] || grp[i / 3 * 3 + j / 3][cur]

      row[i][cur] = true
      col[j][cur] = true
      grp[i / 3 * 3 + j / 3][cur] = true
    end
  end
  true
end
