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
  mp = {}
  candidates.each do |c|
    mp[c] = true
  end

  ret = []

  mp.keys.each do |k|
    if k > target
      next
    end
    if k == target
      ret << [k]
      next
    end
    if k < target
      s = combination_sum(candidates, target - k)
      for i in (0..s.length-1)
        one = s[i].dup
        one << k
        one.sort!
        if !ret.include? one
          ret << one
        end
      end
    end
  end

  return ret
end
