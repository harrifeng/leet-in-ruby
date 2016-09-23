require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_008
    assert_equal(-123, my_atoi('-123'))
    assert_equal(-2_147_483_648, my_atoi('-2147483648'))
    assert_equal(2_147_483_647, my_atoi('2147483648'))
    assert_equal 123, my_atoi('123')
    assert_equal 0, my_atoi('')
  end
end
# @param {String} str
# @return {Integer}
def my_atoi(str)
  str = str.strip
  return 0 if str.length.zero?
  ret = 0
  sign = 1
  imin = -1 << 31
  imax = (1 << 31) - 1
  str.length.times do |i|
    if i.zero? && ['-', '+'].include?(str[i])
      sign = -1 if str[i] == '-'
    elsif ('0'.ord..'9'.ord).cover?(str[i].ord)
      ret = ret * 10 + str[i].to_i

      return imin if ret * sign <= imin
      return imax if ret * sign >= imax
    else
      break
    end
  end
  sign * ret
end
