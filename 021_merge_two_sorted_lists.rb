require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_021
    lna1 = ListNode.get_ln_from_array([2, 4, 16])
    lna2 = ListNode.get_ln_from_array([1, 14, 15])
    exp_a = ListNode.get_ln_from_array([1, 2, 4, 14, 15, 16])
    assert ListNode.two_ln_equal(exp_a, merge_two_lists(lna1, lna2))
  end
end


def merge_two_lists(l1, l2)
  dummy = ListNode.new(-1)
  cur = dummy

  while !l1.nil? && !l2.nil?
    if l1.val < l2.val
      cur.next = l1
      l1 = l1.next
    else
      cur.next = l2
      l2 = l2.next
    end
    cur = cur.next
  end

  cur.next = l1 unless l1.nil?
  cur.next = l2 unless l2.nil?
  dummy.next
end
