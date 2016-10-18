require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_044
    assert is_match_2('aa', 'aa')
    assert is_match_2('aa', '*')
    assert is_match_2('aa', 'a*')
    assert is_match_2('ab', '?*')
    assert !is_match_2('aa', 'a')
    assert !is_match_2('aab', 'c*a*b')
  end
end

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match_2(s, p)
  dp = Array.new(s.length + 1) { Array.new(p.length + 1, false) }
  dp[0][0] = true

  1.upto(p.length) { |j| dp[0][j] = dp[0][j - 1] if p[j - 1] == '*' }

  1.upto(s.length) do |i|
    1.upto(p.length) do |j|
      if p[j - 1] == '*'
        dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
      else
        dp[i][j] = dp[i - 1][j - 1] && (s[i - 1] == p[j - 1] || '?' == p[j - 1])
      end
    end
  end
  dp[s.length][p.length]
end
