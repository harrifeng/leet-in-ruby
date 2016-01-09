require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_true is_palindrome(2332)
    assert_true is_palindrome(20002)
    assert_false is_palindrome(-2332)
  end
end

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  if x < 0
    return false
  end
  size = 1
  tmp = x
  while tmp > 9 do
    size *= 10
    tmp /= 10
  end

  while size > 9 do
    if x / size != x % 10
      return false
    end
    x = x % size / 10
    size /= 100
  end
  return true
end
