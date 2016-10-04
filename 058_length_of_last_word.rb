require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_058
    assert_equal 1, length_of_last_word(' a b ')
    assert_equal 5, length_of_last_word('Hello World')
  end
end

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s.strip!
  return 0 if s.length.zero?
  s.split(' ')[-1].size
end
