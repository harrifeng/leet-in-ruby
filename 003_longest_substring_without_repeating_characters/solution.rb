require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_two_sum
    assert_equal 12, length_of_longest_substring("wlrbbmqbhcdarzowkkyhiddqscdxrjmowfrxsjybldbefsarcbynecdyggxxpklorellnmpapqfwkhopkmco")
    assert_equal 3, length_of_longest_substring("abcabcbb")
    assert_equal 2, length_of_longest_substring("aab")
    assert_equal 1, length_of_longest_substring("bbbbb")
  end
end


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  index = Array.new(256, -1)
  mx = 0
  len = 0
  i  = 0

  while i < s.length do
    if index[s[i].ord] != -1
      mx = [mx, len].max
      len = 0
      i = index[s[i].ord] + 1
      index.collect!{|n| n = -1}
    end
    len += 1
    index[s[i].ord] = i
    i += 1
  end
  return [mx, len].max
end
