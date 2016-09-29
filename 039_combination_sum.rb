require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_039
    assert_equal([[7], [2, 2, 3]].sort, combination_sum([2, 3, 6, 7], 7))
  end
end

def combination_sum(candidates, target)
  ret = []
  helper_039(candidates.sort, target, [], ret)
  ret
end

def helper_039(arr, left, tmp, ret)
  if left.zero?
    ret.push(tmp.dup)
    return
  end

  arr.each_with_index do |c, i|
    next unless left >= c
    tmp.push(c)
    helper_039(arr[i...arr.length], left - c, tmp, ret)
    tmp.pop
  end
end
