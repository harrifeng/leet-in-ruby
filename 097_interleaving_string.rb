require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_097
    assert is_interleave('aabcc', 'dbbca', 'aadbbcbcac')
    assert !is_interleave('aabcc', 'dbbca', 'aadbbbaccc')
    assert is_interleave('', '', '')
  end
end

# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  m = s1.length
  n = s2.length
  return false if (m + n) != s3.length
  dp = Array.new(m + 1) { Array.new(n + 1, false) }
  dp[0][0] = true

  1.upto(m) do |i|
    dp[i][0] = dp[i - 1][0] && (s1[i - 1] == s3[i - 1])
  end

  1.upto(n) do |j|
    dp[0][j] = dp[0][j - 1] && (s2[j - 1] == s3[j - 1])
  end

  1.upto(m) do |i|
    1.upto(n) do |j|
      dp[i][j] = (dp[i - 1][j] && s1[i - 1] == s3[i + j - 1]) ||
                 (dp[i][j - 1] && s2[j - 1] == s3[i + j - 1])
    end
  end
  dp[m][n]
end
