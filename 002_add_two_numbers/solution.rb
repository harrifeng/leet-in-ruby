require 'test/unit'

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

  def assert_equal_list(l1, l2)
    a1 = []
    a2 = []
    while l1 != nil do
      a1.push l1.val
      l1 = l1.next
    end
    while l2 != nil do
      a2.push l2.val
      l2 = l2.next
    end
    assert_equal a1, a2
  end

  def test_leet_function
    @first = ListNode.new(2)
    @first.next = ListNode.new(4)
    @first.next.next = ListNode.new(3)

    @second = ListNode.new(5)
    @second.next = ListNode.new(6)
    @second.next.next = ListNode.new(4)

    @result = ListNode.new(7)
    @result.next = ListNode.new(0)
    @result.next.next = ListNode.new(8)

    assert_equal_list @result,  add_two_numbers(@first, @second)
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
