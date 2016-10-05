require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_070
    assert_equal 13, climb_stairs(6)
  end
end

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 1 if n == 1
  dp = [0] * (n + 1)
  dp[1] = 1
  dp[2] = 2
  3.upto(n) { |i| dp[i] = dp[i - 1] + dp[i - 2] }
  dp[n]
end
