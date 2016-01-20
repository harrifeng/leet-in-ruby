require 'test/unit'

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 0, str_str("abcde", "abc")
    assert_equal 2, str_str("abcde", "cde")
    assert_equal -1, str_str("abcde", "cdew")
    assert_equal 0, str_str("a", "")
    assert_equal 4, str_str("mississippi", "issip")
  end
end

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  if needle.length == 0
    return 0
  end
  n = nexta(needle)
  i = -1
  k = -1
  while i < haystack.length do
    if k == -1 || haystack[i] == needle[k]
      k += 1
      i += 1
      if k == needle.length
        return (i - needle.length)
      end
    else
      k = n[k]
    end
  end

  return -1
end

def nexta(p)
  n = [-1] * p.length
  j = -1
  i = 0
  while i < p.length - 1 do
    if j == -1 || p[j] == p[i]
      i += 1
      j += 1
      n[i] = j
    else
      j = n[j]
    end
  end

  return n
end
