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
  total = (1..n).reduce(:*)
  str = (1..n).map(&:to_s)

  k -= 1
  ret = ''
  n.downto(1) do |i|
    total /= i
    pos = k / total
    ret += str[pos]
    str.delete_at pos
    k -= pos * total
  end
  ret
end
