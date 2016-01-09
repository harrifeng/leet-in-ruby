class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
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
