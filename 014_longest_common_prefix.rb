require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_014
    assert_equal 'ab', longest_common_prefix(%w(abcd abccc abb))
    assert_equal 'wab', longest_common_prefix(%w(wabcd wab))
  end
end

def longest_common_prefix(strs)
  return '' if strs.length.zero?

  ret = strs[0]
  ret.length.times do |i|
    strs[1...strs.length].each do |str|
      return ret[0...i] if (str.length == i) || (str[i] != ret[i])
    end
  end
  ret
end
