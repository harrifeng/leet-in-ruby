require 'minitest/autorun'
# Test for solution
class MyTest < Minitest::Test
  def test_leet_017
    assert_equal %w(ad ae af bd be bf cd ce cf), letter_combinations('23')
    assert_equal [], letter_combinations('')
  end
end

def letter_combinations(digits)
  ret = []
  helper_017(digits, 0, '', ret)
  ret
end

PHONE_NUMS = {
  '2' => 'abc',
  '3' => 'def',
  '4' => 'ghi',
  '5' => 'jkl',
  '6' => 'mno',
  '7' => 'pqrs',
  '8' => 'tuv',
  '9' => 'wxyz'
}.freeze

def helper_017(digits, level, tmp, ret)
  if level == digits.length
    ret.push tmp.dup
    return
  end

  PHONE_NUMS[digits[level]].each_char do |c|
    helper_017(digits, level + 1, tmp + c, ret)
  end
end
