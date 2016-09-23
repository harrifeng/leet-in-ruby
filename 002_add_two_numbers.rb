require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_002
    lna1 = ListNode.get_ln_from_array([2, 4, 3])
    lna2 = ListNode.get_ln_from_array([5, 6, 4])
    exp_a = ListNode.get_ln_from_array([7, 0, 8])
    assert ListNode.two_ln_equal(exp_a, add_two_numbers(lna1, lna2))

    lnb1 = ListNode.get_ln_from_array([2, 4, 3])
    lnb2 = ListNode.get_ln_from_array([5, 6, 4])
    exp_b = ListNode.get_ln_from_array([9, 0, 8])
    assert !ListNode.two_ln_equal(exp_b, add_two_numbers(lnb1, lnb2))
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  carry = 0
  dummy = ListNode.new(-1)
  cur = dummy
  while !l1.nil? || !l2.nil? || (carry > 0)
    cnt = carry
    unless l1.nil?
      cnt += l1.val
      l1 = l1.next
    end
    unless l2.nil?
      cnt += l2.val
      l2 = l2.next
    end
    cur.next = ListNode.new(cnt % 10)
    cur = cur.next
    carry = cnt / 10
  end
  dummy.next
end
