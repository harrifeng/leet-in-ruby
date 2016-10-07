require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_096
    assert_equal(14, num_trees(4))
    assert_equal(5, num_trees(3))
    assert_equal(2, num_trees(2))
    assert_equal(1, num_trees(1))
  end
end

# @param {Integer} n
# @return {Integer}
def num_trees(n)
  dp = [0] * (n + 1)
  dp[0] = 1
  1.upto(n) do |i|
    i.times do |j|
      dp[i] += dp[j] * dp[i - 1 - j]
    end
  end
  dp[n]
end
