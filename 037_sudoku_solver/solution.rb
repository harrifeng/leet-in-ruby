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
  lines = []
  columns = []
  groups = []
  for i in (0..8)
    lines << []
    columns << []
    groups << []
    for j in (0..8)
      lines[i] << (j + 1).to_s
      columns[i] << (j + 1).to_s
      groups[i] << (j+1).to_s
    end
  end

  for i in (0..8)
    for j in (0..8)
      if board[i][j] != '.'
        lines[i].delete board[i][j]
        columns[j].delete board[i][j]
        groups[i/3*3+j/3].delete board[i][j]
      end
    end
  end

  do_sudoku(lines, columns, groups, board)
end

def do_sudoku(lines, columns, groups, board)
  if empty_multi_array(lines) && empty_multi_array(columns) && empty_multi_array(groups)
    return
  end

  for i in (0..8)
    for j in (0..8)
      if board[i][j] == '.'
        for k in (lines[i].length-1).downto(0) do
          end
      end
    end
  end
end


def empty_multi_array(arr)
  arr.each do |a|
    if !a.empty?
      return false
    end
  end
  return true
end
