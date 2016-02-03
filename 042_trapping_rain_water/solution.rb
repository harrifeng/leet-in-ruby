require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 6, trapt([0,1,0,2,1,0,1,3,2,1,2,1])
  end
end


# @param {Integer[]} height
# @return {Integer}
def trapt(height)
  if height.length <= 1
    ret 0
  end
  maxp = 0
  for i in (0..height.length-1)
    if height[maxp] < height[i]
      maxp = i
    end
  end

  ret = 0
  lefth = height[0]
  for i in (1..maxp)
    if height[i] < lefth
      ret += lefth - height[i]
    else
      lefth = height[i]
    end
  end

  i = height.length - 2
  righth = height[height.length-1]
  while i > maxp
    if height[i] < righth
      ret += righth - height[i]
    else
      righth = height[i]
    end
    i -= 1
  end
  return ret
end
