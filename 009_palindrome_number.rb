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

  size = 1
  tmp = x

  while tmp > 9
    size  *= 10
    tmp /= 10
  end

  while size > 9
    return false if x / size != x % 10
    x = x % size / 10
    size /= 100
  end

  true
end
