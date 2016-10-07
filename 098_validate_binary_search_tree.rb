require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_098
    assert is_valid_bst(TreeNode.get_tree_from_array([1, '#', 2]))
    assert !is_valid_bst(TreeNode.get_tree_from_array([1, 2]))
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  helper_098(root, -2**63, 2**63 - 1)
end

def helper_098(root, min, max)
  return true if root.nil?
  return false if (root.val <= min) || (root.val >= max)
  helper_098(root.left, min, root.val) &&
    helper_098(root.right, root.val, max)
end
