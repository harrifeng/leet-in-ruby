require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 4, longest_valid_parentheses(")()())")
    assert_equal 2, longest_valid_parentheses("(()")
    assert_equal 2, longest_valid_parentheses("()(()")
    assert_equal 0, longest_valid_parentheses("")
    assert_equal 8, longest_valid_parentheses("((()))())")
    assert_equal 4, longest_valid_parentheses(")()())()()(")
  end
end

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  if s.length == 0
    return 0
  end
  count = [0] * s.length
  stack = []
  for i in (0..s.length-1) do
    if s[i] == '('
      stack.push s[i]
    elsif s[i] == ')'
      if stack.size == 0 || stack.last == ')'
        stack.push s[i]
      else
        stack.pop
        count[stack.size] += count[stack.size+1] + 2
        count[stack.size+1] = 0
      end
    end
  end
  return count.max
end
