require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_107
    assert_equal [[15, 7],
                  [9, 20],
                  [3]],
                 level_order_bottom(TreeNode.get_tree_from_array([3, 9, 20, '#',
                                                                  '#', 15, 7]))
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root.nil?
  left_arr = level_order_bottom(root.left)
  right_arr = level_order_bottom(root.right)

  len = [left_arr.length, right_arr.length].max
  dif = (left_arr.length - right_arr.length).abs
  ret = []
  len.times do |i|
    if left_arr.length < right_arr.length
      if i >= dif
        ret.push(left_arr[i - dif] + right_arr[i])
      else
        ret.push(right_arr[i])
      end
    else
      if i >= dif
        ret.push(left_arr[i] + right_arr[i - dif])
      else
        ret.push(left_arr[i])
      end
    end
  end

  ret + [[root.val]]
end
