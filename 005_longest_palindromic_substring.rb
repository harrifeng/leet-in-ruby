require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_005
    assert_equal 'abccba', longest_palindrome('abccbaaaa')
    assert_equal 'cc', longest_palindrome('ccd')
    assert_equal 'bb', longest_palindrome('abb')
    assert_equal 'a', longest_palindrome('a')
    assert_equal 'bcb', longest_palindrome('abcbe')
    assert_equal 'aaabaaa', longest_palindrome('aaabaaaa')
  end
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  t = '^#' + s.split('').join('#') + '#%'
  size = [0] * 3000
  centeri = 0
  righti = 0
  maxp = 0
  maxi = 0

  1.upto(t.length - 2) do |i|
    start = 1
    start = [righti - i, size[2 * centeri - i]].min if i < righti

    start += 1 while t[i + start] == t[i - start]
    size[i] = start

    if size[i] + i > righti
      righti = size[i] + i
      centeri = i
    end

    if maxp < size[i]
      maxp = size[i]
      maxi = i
    end
  end
  s[maxi / 2 - maxp / 2, maxp - 1]
end
