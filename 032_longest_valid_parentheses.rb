require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_032
    assert_equal 2, longest_valid_parentheses('()')
    assert_equal 4, longest_valid_parentheses(')()())')
    assert_equal 4, longest_valid_parentheses('(()()')
  end
end

def longest_valid_parentheses(s)
  front = 0
  sta = []
  maxv = 0

  s.length.times do |i|
    if s[i] == '('
      sta.push(i)
    elsif sta.empty?
      front = i + 1
    else
      sta.pop
      maxv = if sta.empty?
               [maxv, i - front + 1].max
             else
               [maxv, i - sta.last].max
             end
    end
  end
  maxv
end
