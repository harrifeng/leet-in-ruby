require 'test/unit'
require_relative '../util/list_node'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    first = array_to_list([2, 4, 3])
    second = array_to_list([5, 6, 4])
    result = array_to_list([7, 0, 8])
    assert_equal_list result,  add_two_numbers(first, second)
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l3 = ListNode.new(-1)
  tmp = l3
  adv = 0

  while l1 || l2 do
    v1 = (l1 == nil) ? 0 : l1.val
    v2 = (l2 == nil) ? 0 : l2.val
    vsum = v1 + v2 + adv
    tmp.next = ListNode.new(vsum % 10)
    adv = vsum / 10
    tmp = tmp.next
    l1 = (l1 == nil) ? nil : l1.next
    l2 = (l2 == nil) ? nil : l2.next
  end
  if adv == 1
    tmp.next = ListNode.new(1)
  end
  return l3.next
end
