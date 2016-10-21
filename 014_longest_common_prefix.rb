require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_014
    assert_equal 'ab', longest_common_prefix(%w(abcd abccc abb))
    assert_equal 'wab', longest_common_prefix(%w(wabcd wab))
  end
end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.length.zero?
  pre = strs[0]
  pre.length.times do |i|
    strs.drop(1).each do |str|
      return pre[0...i] if str.length == i || str[i] != pre[i]
    end
  end
  pre
end
