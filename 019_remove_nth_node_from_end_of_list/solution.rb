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

  def array_to_list(arr)
    if arr == nil
      return nil
    end
    head = ListNode.new(arr[0])
    tmp = head
    for i in (1..arr.length-1) do
      head.next = ListNode.new(arr[i])
      head = head.next
    end
    return tmp
  end

  def test_add_two_numbers
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
