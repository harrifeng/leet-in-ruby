require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_040
    assert_equal [[1, 7], [1, 2, 5], [2, 6], [1, 1, 6]].sort,
                 combination_sum2([10, 1, 2, 7, 6, 1, 5], 8)
  end
end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  ret = []
  helper_040(candidates.sort, target, [], ret)
  ret
end

def helper_040(arr, target, tmp, ret)
  if target.zero?
    ret.push tmp.dup
    return
  end

  arr.each_with_index do |c, i|
    next if i > 0 && (arr[i] == arr[i - 1])
    next unless target >= c
    tmp.push c
    helper_040(arr[i + 1...arr.length], target - c, tmp, ret)
    tmp.pop
  end
end

############################################################################################
# Why should we skip if the arr[i] == arr[i-1]?                                            #
# See following example arr = [1, 1, 2, 5, 6, 7, 10] and target 8                          #
# We had two 1s, if we do not give up on you will find that                                #
# After one generation, they will have same subtree, it's duplicated                       #
#                                                                                          #
#                                                                                          #
#                       +----------------------------+---------------+----+----+----+----+ #
#                       |                            |               |    |    |    |    | #
#                       |                            |               |    |    |    |    | #
#                       1                            1               2    5    6    7   10 #
#                       |                            |                                     #
#           +----+----+-+--+----+----+     +----+----+----+----+                           #
#           |    |    |    |    |    |     |    |    |    |    |                           #
#           |    |    |    |    |    |     |    |    |    |    |                           #
#           1    2    5    6    7   10     2    5    6    7   10                           #
#           |                                                                              #
# +----+----+----+----+                                                                    #
# |    |    |    |    |                                                                    #
# |    |    |    |    |                                                                    #
# 2    5    6    7   10                                                                    #
############################################################################################
