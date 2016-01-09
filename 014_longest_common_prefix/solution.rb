# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal "ab", longest_common_prefix(["abcd", "abccc", "abbbb"])
    assert_equal "wab", longest_common_prefix(["wabcdsssc", "wabccc", "wabbbb"])
  end
end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  if strs.length == 0
    return ""
  end
  ret = ""
  for i in (0..strs[0].length-1) do
    for j in (1..strs.length-1) do
      if strs[j].length < i + 1 || strs[0][i] != strs[j][i]
        return ret
      end
    end
    ret += strs[0][i]
  end
  return ret
end
