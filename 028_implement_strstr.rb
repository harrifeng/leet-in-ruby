require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_028
    assert_equal 3, str_str('abcxyz', 'xyz')
    assert_equal 0, str_str('abcd', 'abc')
    assert_equal(-1, str_str('abcde', 'cdew'))
    assert_equal 4, str_str('mississippi', 'issip')
  end
end

def str_str(s, p)
  i = 0
  j = 0
  while i < s.length && j < p.length
    if s[i] == p[j]
      i += 1
      j += 1
    else
      i = i - j + 1
      j = 0
    end
  end
  return i - j if j == p.length
  -1
end
