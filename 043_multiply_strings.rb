require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_043
    assert_equal '670592745', multiply('12345', '54321')
  end
end

def multiply(num1, num2)
  ret = 0
  num1.split('').reverse_each.with_index do |bit_i, i|
    num_i = bit_i.to_i * (10**i)
    num2.split('').reverse_each.with_index do |bit_j, j|
      num_j = bit_j.to_i * (10**j)
      ret += num_i * num_j
    end
  end
  ret.to_s
end
