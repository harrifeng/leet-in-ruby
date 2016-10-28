# frozen_string_literal: true
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
  broken = Array.new(2)
  prev = nil
  cur = root

  until cur.nil?
    if cur.left.nil?
      detect(broken, prev, cur)
      prev = cur
      cur = cur.right
    else
      node = cur.left

      node = node.right while !node.right.nil? && node.right != cur

      if node.right.nil?
        node.right = cur
        cur = cur.left
      else
        detect(broken, prev, cur)
        node.right = nil
        prev = cur
        cur = cur.right
      end
    end
  end
  broken[0].val, broken[1].val = broken[1].val, broken[0].val
end

def detect(broken, prev, cur)
  if !prev.nil? && prev.val > cur.val
    broken[0] = prev if broken[0].nil?
    broken[1] = cur
  end
end
