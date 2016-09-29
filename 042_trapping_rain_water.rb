require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_042
    assert_equal 6, trap_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
  end
end

def trap_water(height)
  return 0 if height.length < 3

  max_index = height.index(height.max)

  ret = 0
  tmp_max = height.first

  1.upto(max_index) do |i|
    if height[i] < tmp_max
      ret += tmp_max - height[i]
    else
      tmp_max = height[i]
    end
  end

  tmp_max = height.last
  (height.length - 2).downto(max_index) do |i|
    if height[i] < tmp_max
      ret += tmp_max - height[i]
    else
      tmp_max = height[i]
    end
  end
  ret
end
