require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_040
    assert_equal [[1, 7], [1, 2, 5], [2, 6], [1, 1, 6]].sort,
                 combination_sum_2([10, 1, 2, 7, 6, 1, 5], 8)
  end
end

def combination_sum_2(candidates, target)
  ret = []
  helper_040(candidates.sort, target, [], ret)
  ret
end

def helper_040(arr, left, tmp, ret)
  if left.zero?
    ret.push(tmp.dup)
    return
  end

  arr.each_with_index do |c, i|
    next if i > 0 && (arr[i] == arr[i - 1])
    next unless left >= c
    tmp.push(c)
    helper_040(arr[i + 1...arr.length], left - c, tmp, ret)
    tmp.pop
  end
end
