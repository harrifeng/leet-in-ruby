# This class is used for leetcode solution
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end


  def self.get_tree_from_array(arr)
    return nil if arr.length.zero?
    arr.reverse!

    root = TreeNode.new(arr.pop)
    queue = []
    queue.push(root)

    while !queue.empty?
      cur = queue.shift
      if arr.length > 0
        lnode = arr.pop
        if lnode != '#'
          cur.left = TreeNode.new(lnode)
          queue.push cur.left
        end
      end
      if arr.length > 0
        rnode = arr.pop
        if rnode != '#'
          cur.right = TreeNode.new(rnode)
          queue.push cur.right
        end
      end
    end
    root
  end

  def self.two_tr_equal(t1, t2)
    return true if t1.nil? && t2.nil?
    return false if t1.nil? && !t2.nil?
    return false if !t1.nil? && t2.nil?
    return false if t1.val != t2.val
    return two_tr_equal(t1.left, t2.left) && two_tr_equal(t1.right, t2.right)
  end
end
