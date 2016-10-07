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
  k = s3.length

  return false if m + n != k

  dp = Array.new(m + 1) { Array.new(n + 1, false) }

  (m + 1).times do |i|
    (n + 1).times do |j|
      dp[i][j] = if i.zero? && j.zero?
                   true
                 elsif i > 0 && dp[i - 1][j] && s1[i - 1] == s3[i + j - 1]
                   true
                 elsif j > 0 && dp[i][j - 1] && s2[j - 1] == s3[i + j - 1]
                   true
                 else
                   false
                 end
    end
  end
  dp[m][n]
end
