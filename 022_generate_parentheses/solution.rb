require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal ["((()))", "(()())", "(())()", "()(())", "()()()"], generate_parenthesis(3)
    r4 = ["(((())))",
          "((()()))",
          "((())())",
          "((()))()",
          "(()(()))",
          "(()()())",
          "(()())()",
          "(())(())",
          "(())()()",
          "()((()))",
          "()(()())",
          "()(())()",
          "()()(())",
          "()()()()"]
    assert_equal r4, generate_parenthesis(4)
  end
end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  ret = []
  helper(ret, "", n, n)
  return ret
end

# @param {String[]} ret
# @param {String} tmp
# @param {Integer} l
# @param {Integer} r
def helper(ret, tmp, l, r)
  if l == 0 && r == 0
    ret.push(tmp)
    return
  end

  if l > 0
    tmp += "("
    helper(ret, tmp, l - 1, r)
    tmp = tmp[0..-2]
  end

  if r > 0 && r > l
    tmp += ")"
    helper(ret, tmp, l, r - 1)
  end
end
