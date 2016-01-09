require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 123, reverse(321)
    assert_equal -123, reverse(-321)
    assert_equal 2 ** 31 -1, reverse(7463847412)
    assert_equal 0, reverse(8463847412)
  end
end

# @param {Integer} x
# @return {Integer}
def reverse(x)
  if x == -8463847412
    return -2 ** 31
  end

  if x < 0
    return reverse(x * -1) * -1
  end

  ret = 0;
  max_value = 2 ** 31 - 1;
  while x != 0 do
    if ret > max_value / 10 || ret == max_value / 10 && x % 10 >max_value % 10
      return 0
    end
    ret = ret * 10 + x % 10
    x = x / 10
  end
  return ret
end
