require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[7],[2, 2, 3]].sort, combination_sum([2, 3, 6, 7], 7).sort
  end
end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates.sort!
  ret = []
  do_sum(candidates, target, 0, [], ret)
  return ret
end

# c candidates
# gap remining num
# start from 0
# tmp result
# result final
def do_sum(c, gap, start, tmp, result)
  if gap == 0
    result << tmp.dup
    return
  end

  for i in (start..c.length-1)
    if gap < c[i]
      return
    end
    tmp << c[i]
    do_sum(c, gap - c[i], i, tmp, result)
    tmp.pop
  end
end
