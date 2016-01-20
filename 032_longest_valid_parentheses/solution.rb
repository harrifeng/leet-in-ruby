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
  end
end

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  count = [0] * s.length
  stack = []
  for i in (0..s.length-1) do
    if s[i] == '('
      stack.push s[i]
    elsif s[i] == ')'
      if stack.size > 0
        stack.pop
        sum = 2
        for j in (stack.size..i) do
          sum += count[j]
          count[j] = 0
        end
        count[stack.size] += sum
      end
    end
  end
  return count.max
end
