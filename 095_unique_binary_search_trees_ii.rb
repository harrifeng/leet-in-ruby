require 'minitest/autorun'
require_relative 'ds/tree_node'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_095
    e1 = []
    e1.push(TreeNode.get_tree_from_array([1, '#', 2]))
    e1.push(TreeNode.get_tree_from_array([2, 1]))
    r1 = generate_trees(2)
    assert_equal e1.length, r1.length
    r1.zip(e1).map { |arr| assert TreeNode.two_tr_equal(arr[0], arr[1]) }
  end
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  return [] if n.zero?
  helper_095((1...n + 1).to_a)
end

def helper_095(arr)
  return [nil] if arr.length.zero?
  ret = []
  arr.length.times do |i|
    left = helper_095(arr[0...i])
    right = helper_095(arr[i + 1...arr.length])
    left.each do |j|
      right.each do |k|
        dummy = TreeNode.new(arr[i])
        dummy.left = j
        dummy.right = k
        ret.push dummy
      end
    end
  end
  ret
end
