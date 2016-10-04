require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_063
    assert_equal 2, unique_paths_with_obstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
  end
end

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  return 0 if obstacle_grid.length.zero?
  m = obstacle_grid.length
  n = obstacle_grid[0].length

  dp = Array.new(m) { Array.new(n, 0) }

  m.times do |i|
    break if obstacle_grid[i][0] == 1
    dp[i][0] = 1
  end

  n.times do |j|
    break if obstacle_grid[0][j] == 1
    dp[0][j] = 1
  end

  1.upto(m - 1) do |i|
    1.upto(n - 1) do |j|
      dp[i][j] = if obstacle_grid[i][j] == 1
                   0
                 else
                   dp[i][j - 1] + dp[i - 1][j]
                 end
    end
  end
  dp[m - 1][n - 1]
end
