require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_089
    assert_equal [0, 1, 3, 2], gray_code(2)
  end
end

# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  return [0] if n.zero?

  old_half = gray_code(n - 1)
  new_half = old_half.reverse.map { |v| v + 2**(n - 1) }
  old_half + new_half
end
