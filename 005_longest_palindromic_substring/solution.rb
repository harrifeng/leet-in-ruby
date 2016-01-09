require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal "abccba", longest_palindrome("abccbaaaa")
    assert_equal "cc", longest_palindrome("ccd")
    assert_equal "bb", longest_palindrome("abb")
    assert_equal "a", longest_palindrome("a")
    assert_equal "bcb", longest_palindrome("abcbe")
    assert_equal "aaabaaa", longest_palindrome("aaabaaaa")
  end
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  ns = "^#" + s.scan(/./).join("#") + "#!"
  size = [0] * ns.length
  i = 1
  max_center = 0
  max_right = 0

  # pass 1st and last
  while i < ns.length - 1 do
    len = 0
    if i < max_right
      len = [size[2 * max_center - i], (max_right - i)].min
    end

    while ns[i-len-1] == ns[i+len+1] do
      len += 1
    end

    size[i] = len
    if size[i] + i > max_right
      max_right = size[i] + i
      max_center = i
    end
    i += 1
  end
  ns[(size.index(size.max) - size.max)..(size.index(size.max) + size.max)].tr('#', '')
end
