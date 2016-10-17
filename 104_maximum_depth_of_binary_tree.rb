require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_104
    assert_equal 3, max_depth(TreeNode.get_tree_from_array([3, 9, 20, '#',
                                                            '#', 15, 7]))
  end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?
  1 + [max_depth(root.left), max_depth(root.right)].max
end
