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
    h1 = array_to_list([1, 12, 13, 41, 51])
    h2 = array_to_list([11, 15, 31, 144, 511])
    r1 = array_to_list([1, 11, 12, 13, 15, 31, 41, 51, 144, 511])
    assert_equal_list r1,  merge_two_lists(h1, h2)
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  dummy = ListNode.new(-1)
  tmp = dummy
  while l1 != nil && l2 != nil do
    if l1.val < l2.val
      dummy.next = l1
      l1 = l1.next
      dummy = dummy.next
    else
      dummy.next = l2
      l2 = l2.next
      dummy = dummy.next
    end
  end
  if l2.nil?
    dummy.next = l1
  else
    dummy.next = l2
  end
  return tmp.next
end
