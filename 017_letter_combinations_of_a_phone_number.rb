require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_017
    assert_equal %w(ad ae af bd be bf cd ce cf), letter_combinations('23')
  end
end

def letter_combinations(digits)
  return 0 if digits.length.zero?

  ret = []
  helper(digits, 0, '', ret)
  ret
end

PHONE_NUMBER = {
  '2' => 'abc',
  '3' => 'def',
  '4' => 'ghi',
  '5' => 'jkl',
  '6' => 'mno',
  '7' => 'pqrs',
  '8' => 'tuv',
  '9' => 'wxyz'
}.freeze

def helper(dig, level, tmp, ret)
  if dig.length == level
    ret.push(tmp.dup)
    return
  end

  cur = PHONE_NUMBER[dig[level]]
  cur.each_char do |c|
    helper(dig, level + 1, tmp + c, ret)
  end
end
