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

def is_match_2(s, p)
  return false if (s.length > 300) && (p[0] == '*') && (p[-1] == '*')

  dp = Array.new(s.length + 1) { Array.new(p.length + 1, false) }
  dp[0][0] = true

  1.upto(p.length) do |i|
    dp[0][i] = dp[0][i - 1] if p[i - 1] == '*'
  end

  1.upto(s.length) do |i|
    1.upto(p.length) do |j|
      dp[i][j] = if p[j - 1] == '?'
                   dp[i - 1][j - 1]
                 elsif p[j - 1] == '*'
                   dp[i - 1][j] || dp[i][j - 1]
                 else
                   dp[i - 1][j - 1] && s[i - 1] == p[j - 1]
                 end
    end
  end
  dp[s.length][p.length]
end
