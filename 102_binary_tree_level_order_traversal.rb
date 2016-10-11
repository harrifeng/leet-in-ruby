require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_102
    assert_equal [[3],
                  [9, 20],
                  [15, 7]],
                 level_order(TreeNode.get_tree_from_array([3, 9, 20, '#',
                                                           '#', 15, 7]))
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  left_arr = level_order(root.left)
  right_arr = level_order(root.right)

  len = [left_arr.length, right_arr.length].min
  ret = [[root.val]]
  len.times do |i|
    ret.push(left_arr[i] + right_arr[i])
  end

  ret += right_arr.drop(len) if left_arr.length < right_arr.length
  ret += left_arr.drop(len) if left_arr.length > right_arr.length
  ret
end
