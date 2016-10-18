require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_007
    assert_equal 123, reverse(321)
    assert_equal(-123, reverse(-321))
    assert_equal 0, reverse(2**31)
  end
end

# @param {Integer} x
# @return {Integer}
def reverse(x)
  sign = 1
  sign = -1 if x < 0
  x = x.abs
  ret = 0

  while x > 0
    ret = ret * 10 + x % 10
    x /= 10
  end
  return 0 if ret > (2**31 - 1)
  sign * ret
end
