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

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  i = 0
  j = 0

  while i < haystack.length && j < needle.length
    if haystack[i] == needle[j]
      i += 1
      j += 1
    else
      i = i - j + 1
      j = 0
    end
  end

  return i - j if j == needle.length
  -1
end
