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
    h1 = array_to_list([1, 2, 3, 4, 5])
    r1 = array_to_list([1, 2, 3, 5])
    assert_equal_list r1,  remove_nth_from_end(h1, 2)

    h1 = array_to_list([1, 2, 3, 4, 5])
    r1 = array_to_list([1, 2, 3, 4])
    assert_equal_list r1,  remove_nth_from_end(h1, 1)

    h1 = array_to_list([1, 2, 3, 4, 5])
    r1 = array_to_list([2, 3, 4, 5])
    assert_equal_list r1,  remove_nth_from_end(h1, 5)
  end
end

def remove_nth_from_end(head, n)
  tmp = head
  tmp2 = head
  for i in (1..n) do
    tmp = tmp.next
  end
  if tmp == nil
    return head.next
  end
  while tmp.next != nil do
    tmp = tmp.next
    head = head.next
  end
  head.next = head.next.next
  return tmp2
end
