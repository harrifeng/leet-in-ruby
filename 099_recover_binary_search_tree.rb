require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_099
    e1 = TreeNode.get_tree_from_array([1, '#', 2])
    r1 = TreeNode.get_tree_from_array([2, '#', 1])
    recover_tree(r1)
    assert TreeNode.two_tr_equal(e1, r1)
  end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  @n1 = nil
  @n2 = nil
  @prev = nil
  helper_099(root)
  @n1.val, @n2.val = @n2.val, @n1.val
end

def helper_099(root)
  unless root.nil?
    helper_099(root.left)
    if !@prev.nil? && @prev.val > root.val
      @n2 = root
      @n1 = @prev if @n1.nil?
    end
    @prev = root
    helper_099(root.right)
  end
end
