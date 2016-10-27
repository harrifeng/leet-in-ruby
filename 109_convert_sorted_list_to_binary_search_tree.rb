require 'minitest/autorun'
require_relative 'ds/tree_node'
require_relative 'ds/list_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_109
    e1 = TreeNode.get_tree_from_array([4, 2, 6, 1, 3, 5, 7])
    assert TreeNode.two_tr_equal(e1, sorted_list_to_bst(
                                       ListNode.get_ln_from_array([1, 2, 3, 4,
                                                                   5, 6, 7])
    ))

    e2 = TreeNode.get_tree_from_array([5, 3, 8])
    assert TreeNode.two_tr_equal(e2, sorted_list_to_bst(
                                       ListNode.get_ln_from_array([3, 5, 8])
    ))
  end
end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  return head if head.nil? || head.next.nil?
  len = 0
  tmp = head
  until tmp.nil?
    tmp = tmp.next
    len += 1
  end

  helper_109({ list_val: head }, 0, len - 1)
end

def helper_109(list_hash, front, back)
  return nil if front > back

  mid = (front + back) / 2

  tmp_left = helper_109(list_hash, front, mid - 1)
  root = TreeNode.new(list_hash[:list_val].val)
  list_hash[:list_val] = list_hash[:list_val].next
  root.left = tmp_left
  root.right = helper_109(list_hash, mid + 1, back)
  root
end
