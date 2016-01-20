# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert is_valid("()[]{}")
    assert is_valid("()[]{({})}")
    assert !is_valid("(()[]{({})}")
  end
end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  st = []
  s.each_char do |c|
    if ['(', '{', '[' ].include? c
      st.push c
    elsif c == ')' && st.last == '('
      st.pop
    elsif c == '}' && st.last == '{'
      st.pop
    elsif c == ']' && st.last == '['
      st.pop
    else
      return false
    end
  end
  return st.empty?
end