require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_106
    exp = TreeNode.get_tree_from_array([3, 9, 20, '#', '#', 15, 7])
    assert TreeNode.two_tr_equal(exp, build_tree_ii([9, 3, 15, 20, 7],
                                                    [9, 15, 7, 20, 3]))
  end
end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree_ii(inorder, postorder)
  return nil if inorder.length.zero?
  root = TreeNode.new(postorder[-1])
  left_len = inorder.index(postorder[-1])
  right_len = inorder.length - 1 - left_len

  root.left = build_tree_ii(inorder.first(left_len), postorder.first(left_len))
  root.right = build_tree_ii(inorder.last(right_len),
                             postorder.slice(left_len, right_len))
  root
end
