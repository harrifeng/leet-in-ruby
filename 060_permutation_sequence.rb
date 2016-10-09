require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_060
    assert_equal '213', get_permutation(3, 3)
  end
end

# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  nums = (1..n).to_a
  group = (1..n).reduce(:*)
  ret = ''

  k -= 1
  n.downto(1) do |i|
    group /= i
    pos = k / group
    ret += nums[pos].to_s
    nums.delete_at(pos)
    k -= pos * group
  end
  ret
end
