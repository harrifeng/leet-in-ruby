require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_105
    exp = TreeNode.get_tree_from_array([3, 9, 20, '#', '#', 15, 7])
    assert TreeNode.two_tr_equal(exp, build_tree([3, 9, 20, 15, 7],
                                                 [9, 3, 15, 20, 7]))
  end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.length.zero?
  root = TreeNode.new(preorder[0])

  left_len = inorder.index(preorder[0])
  right_len = inorder.length - 1 - left_len

  root.left = build_tree(preorder[1, left_len], inorder[0, left_len])
  root.right = build_tree(preorder.last(right_len), inorder.last(right_len))
  root
end
