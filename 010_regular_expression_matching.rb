require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_010
    assert is_match('aa', 'aa')
    assert is_match('aa', 'a*')
    assert is_match('aa', '.*')
    assert is_match('ab', '.*')
    assert is_match('aab', 'c*a*b')
    assert !is_match('aa', 'a')
    assert !is_match('aaa', 'aa')
  end
end

def is_match(s, p)
  dp = Array.new(s.length + 1) { Array.new(p.length + 1, false) }
  dp[0][0] = true

  2.upto(p.length) do |i|
    dp[0][i] = dp[0][i - 2] if p[i - 1] == '*'
  end

  1.upto(s.length) do |i|
    1.upto(p.length) do |j|
      if p[j - 1] == '*'
        dp[i][j] = dp[i][j - 1] || dp[i][j - 2] ||
                   (dp[i - 1][j] && (s[i - 1] == p[j - 2] || p[j - 2] == '.'))
      else
        dp[i][j] = dp[i - 1][j - 1] && (s[i - 1] == p[j - 1] || p[j - 1] == '.')
      end
    end
  end
  dp[s.length][p.length]
end
