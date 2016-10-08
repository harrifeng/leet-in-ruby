require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_025
    a1 = ListNode.get_ln_from_array([1, 2, 3, 4, 5])
    n1 = 3
    e1 = ListNode.get_ln_from_array([3, 2, 1, 4, 5])

    assert ListNode.two_ln_equal(e1, reverse_k_group(a1, n1))
  end
end

def reverse_k_group(head, k)
  tmp = head
  k.times do
    return head if tmp.nil?
    tmp = tmp.next
  end

  dummy = ListNode.new(-1)
  old_head = head
  k.times do
    cur = head
    head = head.next
    cur.next = dummy.next
    dummy.next = cur
  end
  old_head.next = reverse_k_group(head, k)
  dummy.next
end
