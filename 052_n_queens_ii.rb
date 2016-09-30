require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_052
    assert_equal 2, solve_n_queens(4)
    assert_equal 10, solve_n_queens(5)
  end
end

def solve_n_queens(n)
  @ret = 0
  helper_052(n, 0, [])
  @ret
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

def helper_052(n, level, tmp)
  if level == n
    @ret += 1
    return
  end
  line = '.' * n
  n.times do |i|
    cur_line = line[0...i] + 'Q' + line[i + 1...n]
    tmp.push(cur_line)
    helper_052(n, level + 1, tmp) if queen_valid?(tmp, level, i)
    tmp.pop
  end
end
