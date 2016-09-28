require 'minitest/autorun'
require_relative 'ds/list_node'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_002
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

  merge_two_lists(merge_k_lists(lists[0...lists.length / 2]),
                  merge_k_lists(lists[lists.length / 2..lists.length]))
end

def merge_two_lists(l1, l2)
  dummy = ListNode.new(-1)
  tmp = dummy

  while !l1.nil? && !l2.nil?
    if l1.val < l2.val
      dummy.next = ListNode.new(l1.val)
      l1 = l1.next
    else
      dummy.next = ListNode.new(l2.val)
      l2 = l2.next
    end
    dummy = dummy.next
  end

  dummy.next = l1 unless l1.nil?
  dummy.next = l2 unless l2.nil?

  tmp.next
end
