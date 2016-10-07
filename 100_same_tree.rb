require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_100
    assert is_same_tree(TreeNode.get_tree_from_array([2, '#', 1]),
                        TreeNode.get_tree_from_array([2, '#', 1]))
    assert !is_same_tree(TreeNode.get_tree_from_array([1, '#', 2]),
                         TreeNode.get_tree_from_array([2, '#', 1]))
  end
end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil? # not all nil here
  (p.val == q.val) && is_same_tree(p.left, q.left) &&
    is_same_tree(p.right, q.right)
end
