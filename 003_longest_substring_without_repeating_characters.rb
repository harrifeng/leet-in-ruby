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
  have = {}
  start = 0
  max_len = 0

  s.length.times do |i|
    start = [start, have[s[i]] + 1].max if have.include?(s[i])
    max_len = [max_len, i - start + 1].max
    have[s[i]] = i
  end
  max_len
end
