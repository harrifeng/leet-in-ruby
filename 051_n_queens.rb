require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_051
    assert_equal [['.Q..', '...Q', 'Q...', '..Q.'],
                  ['..Q.', 'Q...', '...Q', '.Q..']], solve_n_queens_ii(4)
  end
end

def is_valid?(board, x, y)
  x.times do |i|
    board[0].length do |j|
      if board[i][j] == 'Q' && (j == y || (x - i).abs == (y-j).abs)
        return false
      end
    end
  end
  true
end


def helper(n, level, tmp, ret)
  if level == n
    ret.push tmp.dup
    return
  end

  line = '.' * n
  level.upto(n-1) do |i|
    cur = line[0...i] + 'Q' + line[i+1...line.length]
    if is_valid?(tmp, level, i)
      tmp.push cur
      helper(n, level + 1, tmp, ret)
      tmp.pop
    end
  end
end


def solve_n_queens_ii(n)
  ret = []
  helper(n, 0, [], ret)
  ret
end
