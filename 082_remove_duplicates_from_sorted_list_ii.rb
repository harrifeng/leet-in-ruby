require 'minitest/autorun'
require_relative 'ds/list_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_082
    a1 = ListNode.get_ln_from_array([1, 2, 3, 3, 4, 4, 5])
    e1 = ListNode.get_ln_from_array([1, 2, 5])
    assert ListNode.two_ln_equal(e1, delete_duplicates_ii(a1))
  end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates_ii(head)
  return head if head.nil? || head.next.nil?

  dummy = ListNode.new(-1)
  dummy.next = head

  pre = dummy
  cur = head

  until cur.next.nil?
    if cur.val != cur.next.val
      if pre.next == cur
        pre = pre.next
      else
        pre.next = cur.next
      end
    end
    cur = cur.next
  end

  pre = pre.next if pre.next == cur
  pre.next = nil
  dummy.next
end
