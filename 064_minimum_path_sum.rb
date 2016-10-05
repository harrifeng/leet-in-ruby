require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_064
    assert_equal 3, min_path_sum([[1, 2], [1, 1]])
  end
end

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  return 0 if grid.length.zero?
  m = grid.length
  n = grid[0].length

  1.upto(m - 1) do |i|
    grid[i][0] += grid[i - 1][0]
  end

  1.upto(n - 1) do |j|
    grid[0][j] += grid[0][j - 1]
  end

  1.upto(m - 1) do |i|
    1.upto(n - 1) do |j|
      grid[i][j] += [grid[i - 1][j], grid[i][j - 1]].min
    end
  end
  grid[m - 1][n - 1]
end
