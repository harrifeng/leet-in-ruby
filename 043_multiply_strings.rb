require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_043
    assert_equal '670592745', multiply('12345', '54321')
    assert_equal '882', multiply('98', '9')
  end
end

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  ret = 0
  num1.chars.reverse.each_with_index do |c_i, i|
    int_i = c_i.to_i * (10**i)
    num2.chars.reverse.each_with_index do |c_j, j|
      int_j = c_j.to_i * (10**j)
      ret += int_i * int_j
    end
  end
  ret.to_s
end
