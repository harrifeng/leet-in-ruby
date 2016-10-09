require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_019
    inpa = ListNode.get_ln_from_array([2, 4, 6])
    inpa_n = 2
    expa = ListNode.get_ln_from_array([2, 6])
    assert ListNode.two_ln_equal(expa, remove_nth_from_end(inpa, inpa_n))
  end
end

def remove_nth_from_end(head, n)
  dummy = ListNode.new(-1)
  dummy.next = head

  fast = dummy
  slow = dummy

  n.times { fast = fast.next }
  until fast.next.nil?
    fast = fast.next
    slow = slow.next
  end
  slow.next = slow.next.next
  dummy.next
end
