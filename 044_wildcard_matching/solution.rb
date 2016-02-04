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
  i = 0
  j = 0
  backupS = -1
  backupP = -1
  while i < s.length
    if j < p.length && (p[j] == '?' || s[i] == p[j])
      i += 1
      j += 1
    elsif j < p.length && p[j] == '*'
      j += 1
      backupS = i
      backupP = j
    else
      if backupP == -1
        return false
      end
      backupS += 1
      i = backupS
      j = backupP
    end
  end

  while j < p.length && p[j] == '*'
    j += 1
  end
  return j == p.length
end
