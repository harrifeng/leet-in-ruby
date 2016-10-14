require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_103
    assert_equal [[3],
                  [20, 9],
                  [15, 7]],
                 zigzag_level_order(TreeNode.get_tree_from_array([3, 9, 20, '#',
                                                                  '#', 15, 7]))
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  ret = helper_013(root)
  ret.each_with_index.map do |c, i|
    if i.odd?
      c.reverse!
    else
      c
    end
  end
end


def helper_013(root)
  return [] if root.nil?
  ret = [[root.val]]

  larr = helper_013(root.left)
  rarr = helper_013(root.right)

  size = [larr.length, rarr.length].min
  size.times do |i|
    ret.push(larr[i] + rarr[i])
  end

  ret += larr.drop(size) if larr.length > rarr.length
  ret += rarr.drop(size) if rarr.length > larr.length
  ret
end
