require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_022
    assert_equal ['((()))', '(()())', '(())()', '()(())', '()()()'],
                 generate_parenthesis(3)
  end
end

def generate_parenthesis(n)
  ret = []
  helper(n, n, '', ret)
  ret
end

def helper(left, right, tmp, ret)
  if left.zero? && right.zero?
    ret.push(tmp.dup)
    return
  end

  helper(left - 1, right, tmp + '(', ret) if left > 0

  helper(left, right - 1, tmp + ')', ret) if right > left
  nil
end
