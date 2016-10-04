require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_061
    a1 = ListNode.get_ln_from_array([1, 2])
    n1 = 1
    e1 = ListNode.get_ln_from_array([2, 1])
    assert ListNode.two_ln_equal(e1, rotate_right(a1, n1))

    a2 = ListNode.get_ln_from_array([1, 2, 3, 4, 5])
    n2 = 2
    e2 = ListNode.get_ln_from_array([4, 5, 1, 2, 3])
    assert ListNode.two_ln_equal(e2, rotate_right(a2, n2))
  end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if head.nil? || head.next.nil?

  tmp = head
  len = 1
  until tmp.next.nil?
    len += 1
    tmp = tmp.next
  end
  tmp.next = head # circle

  size = len - k % len

  dummy = ListNode.new(-1)
  dummy.next = head

  size.times { dummy = dummy.next }
  ret = dummy.next
  dummy.next = nil
  ret
end
