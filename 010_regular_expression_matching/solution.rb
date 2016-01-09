require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert is_match("aa", "aa")
    assert is_match("aa", "a*")
    assert is_match("aa", ".*")
    assert is_match("ab", ".*")
    assert is_match("aab", "c*a*b")
    assert !is_match("aa", "a")
    assert !is_match("aaaaaaaaaaaaab","a*a*a*a*a*a*a*a*a*a*c")
  end
end

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  if p.length == 0
    return s.length == 0
  end
  if p.length == 1
    return s.length == 1 && (s[0] == p[0] || p[0] == '.')
  end
  if p[1] == '*'
    if is_match(s, p[2..p.length])
      return true
    end
    return s.length > 0 && p[0] == '.' || s[0] == p[0]  && is_match(s[1..s.length], p)
  else
    return s.length > 0 && p[0] == '.' || s[0] == p[0]  && is_match(s[1..s.length], p[1..s.length])
  end
end
