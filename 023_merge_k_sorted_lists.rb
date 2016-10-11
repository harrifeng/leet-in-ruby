require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_023
    a1 = ListNode.get_ln_from_array([2, 4, 16])
    b1 = ListNode.get_ln_from_array([1, 14, 15])
    c1 = ListNode.get_ln_from_array([1, 8, 9])
    r1 = [a1, b1, c1]
    e1 = ListNode.get_ln_from_array([1, 1, 2, 4, 8, 9, 14, 15, 16])

    assert ListNode.two_ln_equal(e1, merge_k_lists(r1))
  end
end

def merge_k_lists(lists)
  return nil if lists.length.zero?
  return lists[0] if lists.length == 1
  helper_023(merge_k_lists(lists.take(lists.length / 2)),
             merge_k_lists(lists.drop(lists.length / 2)))
end

def helper_023(l1, l2)
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
