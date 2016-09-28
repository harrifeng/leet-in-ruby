require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_012
    assert_equal 'I', int_to_roman(1)
    assert_equal 'IV', int_to_roman(4)
    assert_equal 'VII', int_to_roman(7)
    assert_equal 'CD', int_to_roman(400)
    assert_equal 'MMCCCXLV', int_to_roman(2345)
  end
end

def int_to_roman(num)
  digits = [[1000, 'M'],
            [900, 'CM'], [500, 'D'], [400, 'CD'], [100, 'C'],
            [90, 'XC'], [50, 'L'], [40, 'XL'], [10, 'X'],
            [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']]
  ret = ''
  digits.each do |d|
    while num >= d[0]
      ret += d[1]
      num -= d[0]
    end
  end
  ret
end
