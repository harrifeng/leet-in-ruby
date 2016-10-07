require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_087
    assert is_scramble('great', 'rgeat')
  end
end

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  return false if s1.length != s2.length
  return false if s1.split('').sort != s2.split('').sort
  return true if s1.length <= 2

  1.upto(s1.length - 1) do |i|
    return true if (is_scramble(s1[0...i], s2[0...i]) &&
                    is_scramble(s1[i...s1.length], s2[i...s2.length])) ||
                   (is_scramble(s1[0...i], s2[-i...s2.length]) &&
                    is_scramble(s1[i...s1.length], s2[0...-i]))
  end
  false
end
