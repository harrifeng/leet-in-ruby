require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_020
    assert is_valid('{}')
    assert is_valid('()[]{}')
    assert !is_valid('{]')
    assert !is_valid('([))')
  end
end

def is_valid(str)
  sta = []
  pair = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  str.each_char do |c|
    if pair.include?(c)
      sta.push(c)
    elsif sta.length.zero? || pair[sta.pop] != c
      return false
    end
  end

  sta.length.zero?
end
