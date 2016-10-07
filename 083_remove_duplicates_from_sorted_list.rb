require 'minitest/autorun'
require_relative 'ds/list_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_083
    a1 = ListNode.get_ln_from_array([1, 1, 2, 3, 3])
    e1 = ListNode.get_ln_from_array([1, 2, 3])
    assert ListNode.two_ln_equal(e1, delete_duplicates(a1))
  end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  cur = head
  until cur.next.nil?
    if cur.val == cur.next.val
      cur.next = cur.next.next
    else
      cur = cur.next
    end
  end
  head
end
