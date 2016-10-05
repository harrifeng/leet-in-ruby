require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_066
    assert_equal [1, 2, 4], plus_one([1, 2, 3])
    assert_equal [1, 0, 0, 0], plus_one([9, 9, 9])
  end
end

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  (digits.length - 1).downto(0) do |i|
    if digits[i] == 9
      digits[i] = 0
    else
      digits[i] += 1
      return digits
    end
  end
  [1] + digits
end
