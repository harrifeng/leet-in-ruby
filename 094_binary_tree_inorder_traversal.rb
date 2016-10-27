require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_094
    root = TreeNode.get_tree_from_array([1, 2, 3])
    assert_equal([2, 1, 3], inorder_traversal(root))
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  return [] if root.nil?
  ret = inorder_traversal(root.left)
  ret.push(root.val)
  ret + inorder_traversal(root.right)
end
