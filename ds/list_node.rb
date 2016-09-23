# This class is used for leetcode solution
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  def self.get_ln_from_array(arr)
    return nil if arr.length.zero?

    head = ListNode.new(-1)
    tmp = head
    arr.each do |one|
      head.next = ListNode.new(one)
      head = head.next
    end
    tmp.next
  end

  def self.two_ln_equal(l1, l2)
    while !l1.nil? && !l2.nil?
      return false if l1.val != l2.val
      l1 = l1.next
      l2 = l2.next
    end
    l1.nil? && l2.nil?
  end
end
