# frozen_string_literal: true
require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_069
    assert_equal 11, my_sqrt(121)
    assert_equal 5, my_sqrt(29)
  end
end

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  front = 0
  back = x

  while front <= back
    mid = (front + back) / 2
    if mid * mid == x
      return mid
    elsif mid * mid < x
      front = mid + 1
    else
      back = mid - 1
    end
  end
  back
end
