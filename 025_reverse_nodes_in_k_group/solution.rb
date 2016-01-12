require 'test/unit'
require_relative '../util/list_node'

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    orig = array_to_list([1, 2, 3, 4, 5])
    r1 = array_to_list([2, 1, 3, 4, 5])
    assert_equal_list r1,  reverse_k_group(orig, 2)

    orig = array_to_list([1, 2, 3, 4, 5])
    r2 = array_to_list([3, 2, 1, 4, 5])
    assert_equal_list r2,  reverse_k_group(orig, 3)

    orig = array_to_list([1, 2, 3, 4, 5])
    r3 = array_to_list([4, 5, 3, 2, 1])
    assert_equal_list r3,  reverse_k_group(orig, 6)
  end
end


# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  if head == nil || head.next == nil
    return head
  end
  if k == 0
    return head
  end
  dummy_new = ListNode.new(-1)
  # dummy_old.next is always the one to process
  dummy_old = ListNode.new(-1)
  dummy_old.next = head
  tmp = head
  overlap = false

  for i in (1..k) do
    if dummy_old.next == nil
      dummy_old = dummy_new.next
      overlap = true
    end
    current = dummy_old.next
    dummy_old.next = current.next

    current.next = dummy_new.next
    dummy_new.next = current
  end

  if !overlap
    tmp.next = dummy_old.next
  end
  return dummy_new.next
end
