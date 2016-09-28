require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_013
    assert_equal 1, roman_to_int('I')
    assert_equal 4, roman_to_int('IV')
    assert_equal 7, roman_to_int('VII')
    assert_equal 400, roman_to_int('CD')
    assert_equal 2345, roman_to_int('MMCCCXLV')
  end
end

def roman_to_int(s)
  return 0 if s.length.zero?
  digits = {
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
  }

  ret = digits[s[s.length - 1]]
  (s.length - 2).downto(0) do |i|
    if digits[s[i]] >= digits[s[i + 1]]
      ret += digits[s[i]]
    else
      ret -= digits[s[i]]
    end
  end
  ret
end
