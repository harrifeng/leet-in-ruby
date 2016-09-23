require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_009
    assert is_palindrome(12_321)
    assert is_palindrome(1_324_231)
    assert !is_palindrome(12_300)
    assert !is_palindrome(-1_324_231)
  end
end

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  tmp = x
  group = 1
  while tmp >= 10
    group *= 10
    tmp /= 10
  end

  while group >= 10
    return false if x / group != x % 10
    x = x % group / 10
    group /= 100
  end
  true
end
