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
  num1.split('').reverse_each.with_index do |c_i, i|
    num_i = c_i.to_i * (10**i)
    num2.split('').reverse_each.with_index do |c_j, j|
      num_j = c_j.to_i * (10**j)
      ret += num_i * num_j
    end
  end
  ret.to_s
end
