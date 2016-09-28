require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_024
    a1 = ListNode.get_ln_from_array([1, 2, 3, 4])
    e1 = ListNode.get_ln_from_array([2, 1, 4, 3])

    assert ListNode.two_ln_equal(e1, swap_pairs(a1))
  end
end

def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  dummy = ListNode.new(-1)
  old_head = head
  2.times do
    cur = head
    head = head.next
    cur.next = dummy.next
    dummy.next = cur
  end
  old_head.next = swap_pairs(head)
  dummy.next
end
