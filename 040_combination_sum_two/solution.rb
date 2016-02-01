require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [], combination_sum2([1, 2], 4)
    assert_equal [[1,1,6],[1,2,5],[1,7],[2,6]].sort, combination_sum2([10,1,2,7,6,1,5], 8).sort
  end
end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  candidates.sort!
  ret = []
  do_com(candidates, 0, target, [], ret)
  return ret
end

def do_com(candidates, start, gap, tmp, result)
  if gap == 0
    result << tmp.dup
    return
  end

  for i in (start..candidates.length-1) do
    if candidates[i] > gap
      return
    end
    tmp << candidates[i]

    do_com(candidates, i+1, gap - candidates[i], tmp, result)

    tmp.pop
  end

end
