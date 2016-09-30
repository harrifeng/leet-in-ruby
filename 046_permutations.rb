require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_046
    assert_equal [[1, 2, 3], [1, 3, 2], [2, 1, 3],
                  [2, 3, 1], [3, 1, 2], [3, 2, 1]].sort, permute([1, 2, 3]).sort
  end
end

def permute(nums)
  ret = []
  helper_046(nums, 0, ret)
  ret
end

def helper_046(arr, level, ret)
  if level == arr.length
    ret.push(arr.dup)
    return
  end
  (level...arr.length).each do |i|
    arr[level], arr[i] = arr[i], arr[level]
    helper_046(arr, level + 1, ret)
    arr[level], arr[i] = arr[i], arr[level]
  end
end
