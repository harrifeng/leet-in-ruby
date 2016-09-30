require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_051
    assert_equal [['.Q..', '...Q', 'Q...', '..Q.'],
                  ['..Q.', 'Q...', '...Q', '.Q..']], solve_n_queens(4)
  end
end

def solve_n_queens(n)
  ret = []
  helper_051(n, 0, [], ret)
  ret
end

def queen_valid?(queen, row, col)
  row.times do |i|
    queen[0].length.times do |j|
      return false if queen[i][j] == 'Q' &&
                      (j == col || (row - i).abs == (col - j).abs)
    end
  end
  true
end

def helper_051(n, level, tmp, ret)
  if level == n
    ret.push(tmp.dup)
    return
  end
  line = '.' * n
  n.times do |i|
    cur_line = line[0...i] + 'Q' + line[i + 1...n]
    tmp.push(cur_line)
    helper_051(n, level + 1, tmp, ret) if queen_valid?(tmp, level, i)
    tmp.pop
  end
end
