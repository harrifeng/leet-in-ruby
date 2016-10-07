require 'minitest/autorun'
require_relative 'ds/list_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_092
    l1 = ListNode.get_ln_from_array([1, 2, 3, 4, 5])
    e1 = ListNode.get_ln_from_array([1, 4, 3, 2, 5])
    assert ListNode.two_ln_equal(e1, reverse_between(l1, 2, 4))
  end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  t = n - m
  dummy = ListNode.new(-1)
  dummy.next = head
  front = dummy
  (m - 1).times { front = front.next }

  back = front.next

  t.times do
    tmp = front.next
    front.next = back.next
    back.next = back.next.next
    front.next.next = tmp
  end
  dummy.next
end
