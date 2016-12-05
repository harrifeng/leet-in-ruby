require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_029
    assert_equal 5, divide(15, 3)
    assert_equal 5000, divide(15_000, 3)
  end
end

def divide(dividend, divisor)
  is_neg = (dividend > 0) != (divisor > 0)

  a = dividend.abs
  b = divisor.abs

  ret = 0
  while (a >= b) do
    ret += 1
    a -= b
  end
  ret
end
