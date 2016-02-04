require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal false, is_match("aa", "a")
    assert_equal false, is_match("aaa", "aa")
    assert_equal false, is_match("aab", "c*a*b")
    assert_equal true, is_match("aa", "aa")
    assert_equal true, is_match("aa", "*")
    assert_equal true, is_match("ab", "?*")
    assert_equal false, is_match("babaaababaabababbbbbbaabaabbabababbaababbaaabbbaaab","***bba**a*bbba**aab**b")
  end
end

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  if p.length == 0
    return s.length == 0
  end

  if p[0] == '*'
    if is_match(s, p[1..-1])
      return true
    else
      return s.length > 0 && is_match(s[1..-1], p)
    end
  elsif p[0] == '?'
    return s.length > 0 && is_match(s[1..-1], p[1..-1])
  else
    return s.length > 0 && p[0] == s[0] && is_match(s[1..-1], p[1..-1])
  end
end
