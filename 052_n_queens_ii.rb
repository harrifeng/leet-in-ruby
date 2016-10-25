require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_052
    assert_equal 2, total_n_queens(4)
    assert_equal 10, total_n_queens(5)
  end
end

# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  ret = { val: 0 }
  helper_052(n, 0, [], ret)
  ret[:val]
end

def valid?(board, x, y)
  return true if board.length.zero?
  x.times do |i|
    board[0].length.times do |j|
      return false if (board[i][j] == 'Q') &&
                      (j == y || (x - i).abs == (y - j).abs)
    end
  end
  true
end

def helper_052(n, level, tmp, ret)
  if level == n
    ret[:val] += 1
    return
  end

  line = '.' * n
  n.times do |i|
    cur_line = line[0...i] + 'Q' + line[i + 1...n]
    tmp.push cur_line
    helper_052(n, level + 1, tmp, ret) if valid?(tmp, level, i)
    tmp.pop
  end
end
