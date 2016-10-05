require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_065
    assert is_number('0')
    assert is_number(' 0.1 ')
    assert is_number('2e10')
    assert is_number('-1.')
    assert is_number(' 005047e+6')

    assert !is_number('abc')
    assert !is_number('1 a')
  end
end

# @param {String} s
# @return {Boolean}
def is_number(s)
  invalid = 0
  space = 1
  sign = 2
  digit = 3
  dot = 4
  exponent = 5

  trans = [
    [-1, 0, 3, 1, 2, -1],     # 0 no input or just spaces
    [-1, 8, -1, 1, 4, 5],     # 1 input is digits
    [-1, -1, -1,  4, -1, -1], # 2 no digits in front just Dot
    [-1, -1, -1,  1, 2, -1],  # 3 sign
    [-1, 8, -1,  4, -1, 5],   # 4 digits and dot in front
    [-1, -1, 6,  7, -1, -1],  # 5 input 'e' or 'E'
    [-1, -1, -1,  7, -1, -1], # 6 after 'e' input sign
    [-1,  8, -1,  7, -1, -1], # 7 after 'e' input digits
    [-1,  8, -1, -1, -1, -1]  # 8 after valid input input space
  ]

  state = 0
  s.length.times do |i|
    inputtype = if s[i] == ' '
                  space
                elsif ['+', '-'].include?(s[i])
                  sign
                elsif '0123456789'.include?(s[i])
                  digit
                elsif s[i] == '.'
                  dot
                elsif %w(e E).include?(s[i])
                  exponent
                else
                  invalid
                end
    state = trans[state][inputtype]
    return false if state == -1
  end
  state == 1 || state == 4 || state == 7 || state == 8
end
