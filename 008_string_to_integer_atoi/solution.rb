require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_two_sum
    assert_equal 1234, my_atoi("1234")
    assert_equal 0, my_atoi("+-2")
    assert_equal -1, my_atoi("-1")
    assert_equal -12, my_atoi("  -0012a42")
    assert_equal 0, my_atoi("  - 321")
  end
end

# @param {String} str
# @return {Integer}
def my_atoi(str)
  beg = 0
  sig = ""
  while str[beg] == " " do
    beg += 1
  end

  while str[beg] == "+" || str[beg] == "-" do
    sig += str[beg].strip
    beg += 1
  end
  neg = false

  if sig.length > 1
    return 0
  end

  if sig == "-"
    neg = true
  end

  if str[beg] == ' '
    return 0
  end

  ret = 0
  max_value = 2 ** 31 - 1
  min_value = -2 ** 31
  while beg < str.length do
    if !('0'..'9').to_a.include?(str[beg])
      return neg ? -1 * ret : ret
    end
    c = str[beg].to_i
    if ret > max_value / 10 || ret == max_value / 10 && c > max_value % 10
      return neg ? min_value : max_value
    end
    ret = ret * 10 + c
    beg += 1
  end
  return neg ? -1 * ret : ret
end
