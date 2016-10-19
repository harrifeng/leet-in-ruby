require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_108
    e1 = TreeNode.get_tree_from_array([4, 2, 6, 1, 3, 5, 7])
    assert TreeNode.two_tr_equal(e1, sorted_array_to_bst([1, 2, 3, 4, 5, 6, 7]))
  end
end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return nil if nums.length.zero?
  root = TreeNode.new(nums[nums.length/2])
  root.left = sorted_array_to_bst(nums[0...nums.length/2])
  root.right = sorted_array_to_bst(nums[nums.length/2+1...nums.length])
  root
end
