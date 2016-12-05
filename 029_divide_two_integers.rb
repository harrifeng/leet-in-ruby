# frozen_string_literal: true
require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_029
    assert_equal 5, divide(15, 3)
    assert_equal 5000, divide(15_000, 3)
    assert_equal 2_147_483_647, divide(-2_147_483_648, -1)
  end
end

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  sign = if dividend.positive? != divisor.positive?
           -1
         else
           1
         end
  a = dividend.abs
  b = divisor.abs

  ret = 0

  while a >= b
    c = b
    i = 0
    while a >= c
      a -= c
      ret += (1 << i)
      i += 1
      c = (c << 1)
    end
  end

  imin = -2**31
  imax = 2**31 - 1
  return imax if ret * sign > imax
  return imin if ret * sign < imin
  ret * sign
end
