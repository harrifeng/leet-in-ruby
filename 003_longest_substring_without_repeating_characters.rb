require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_003
    assert_equal 3, length_of_longest_substring('abcabcbb')
    assert_equal 2, length_of_longest_substring('abba')
  end
end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  had = {}
  start = 0
  maxv = 0

  s.chars.each_with_index do |c, i|
    if had.include?(c)
      start = [start, had[c] + 1].max
    end
    maxv = [maxv, i  - start + 1].max
    had[c] = i
  end
  maxv
end
