# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal "I"   ,  int_to_roman(1)
    assert_equal "II"  ,  int_to_roman(2)
    assert_equal "III" ,  int_to_roman(3)
    assert_equal "IV"  ,  int_to_roman(4)
    assert_equal "V"   ,  int_to_roman(5)
    assert_equal "VI"  ,  int_to_roman(6)
    assert_equal "VII" ,  int_to_roman(7)
    assert_equal "VIII",  int_to_roman(8)
    assert_equal "IX"  ,  int_to_roman(9)
    assert_equal "CD"  ,  int_to_roman(400)
    assert_equal "MMCCCXLV"  ,  int_to_roman(2345)
    assert_equal "MDCCCLXXXVIII"  ,  int_to_roman(1888)
  end
end

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  roman = ["IV", "XL", "CD", "M"]
  ret = ""
  size = 3
  size.downto(0).each do |si|
    digit = num / 10 ** si % 10
    if digit == 0
      next
    elsif digit > 0 && digit < 4
      (1..digit).each {|i| ret += roman[si][0]}
      next
    elsif digit == 4
      ret += roman[si]
      next
    elsif digit < 9
      ret += roman[si][1]
      (1..digit-5).each {|i| ret += roman[si][0]}
      next
    elsif digit == 9
      ret += roman[si][0]+ roman[si+1][0]
    end
  end
  return ret
end
