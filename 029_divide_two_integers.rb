require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_029
    assert_equal 5, divide(15, 3)
    assert_equal 5000, divide(15_000, 3)
  end
end

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  is_neg = (dividend > 0) != (divisor > 0)

  a = dividend.abs
  b = divisor.abs

  ret = 0
  while (a >= b) do
    # ret += 1
    # a -= b
    c = b
    pos = 0
    while (a >= c) do
      a -= c
      ret =  ret + (1 << pos)
      pos += 1
      c = (c << 1)
    end
  end

  if is_neg
    if ret > 2 ** 31 - 1
      return -2 ** 31
    else
      ret * -1
    end
  else
    if ret > 2 ** 31 - 1
      return 2 ** 31 - 1
    else
      return ret
    end
  end
end
