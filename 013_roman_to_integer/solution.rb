# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 1,      roman_to_int("I")
    assert_equal 2,      roman_to_int("II")
    assert_equal 3,      roman_to_int("III")
    assert_equal 4,      roman_to_int("IV" )
    assert_equal 5,      roman_to_int("V")
    assert_equal 6,      roman_to_int("VI")
    assert_equal 8,      roman_to_int("VIII")
    assert_equal 9,      roman_to_int("IX")
    assert_equal 2345,   roman_to_int("MMCCCXLV")
    assert_equal 1888,   roman_to_int("MDCCCLXXXVIII")
  end
end

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  if s.length == 0
    return 0
  end

  roman = {
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1,
  }
  ret = 0
  ret += roman[s[0]]
  for i in (1..s.length-1) do
    v = roman[s[i]]
    if v > roman[s[i-1]]
      ret += (v - 2 * roman[s[i-1]])
    else
      ret += v
    end
  end
  return ret
end
