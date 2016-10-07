require 'minitest/autorun'
require_relative 'ds/list_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_086
    a1 = ListNode.get_ln_from_array([1, 4, 3, 2, 5, 2])
    e1 = ListNode.get_ln_from_array([1, 2, 2, 4, 3, 5])
    assert ListNode.two_ln_equal(e1, partition(a1, 3))
  end
end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  return head if head.nil? || head.next.nil?
  small = ListNode.new(-1)
  tmp_s = small

  big = ListNode.new(-1)
  tmp_b = big

  until head.nil?
    if head.val < x
      small.next = head
      small = small.next
    else
      big.next = head
      big = big.next
    end
    head = head.next
  end

  big.next = nil
  small.next = tmp_b.next
  tmp_s.next
end
