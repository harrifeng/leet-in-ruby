require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_100
    assert is_symmetric(TreeNode.get_tree_from_array([1, 2, 2, 3, 4, 4, 3]))
    assert !is_symmetric(TreeNode.get_tree_from_array([1, 2, 2, '#',
                                                       3, '#', 3]))
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  helper_101(root.left, root.right)
end

def helper_101(l1, l2)
  return true if l1.nil? && l2.nil?
  return false if l1.nil? || l2.nil?

  (l1.val == l2.val) && helper_101(l1.left, l2.right) &&
    helper_101(l1.right, l2.left)
end
