require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_072
    assert_equal 2, min_distance('abc', 'fab')
  end
end

# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  m = word1.length
  n = word2.length

  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  0.upto(m) do |i|
    0.upto(n) do |j|
      if i.zero?
        dp[0][j] = j
      elsif j.zero?
        dp[i][0] = i
      elsif word1[i - 1] == word2[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[m][n]
end
