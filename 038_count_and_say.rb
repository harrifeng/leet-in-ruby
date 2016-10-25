require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_038
    r1 = '1'
    r2 = '11'
    r3 = '21'
    r4 = '1211'
    r5 = '111221'
    assert_equal(r1, count_and_say(1))
    assert_equal(r2, count_and_say(2))
    assert_equal(r3, count_and_say(3))
    assert_equal(r4, count_and_say(4))
    assert_equal(r5, count_and_say(5))
  end
end

# @param {Integer} n
# @return {String}
def count_and_say(n)
  return '1' if n == 1
  old_s = count_and_say(n - 1) + '$'

  count = 1
  ret = ''
  (old_s.length - 1).times do |i|
    if old_s[i] == old_s[i + 1]
      count += 1
    else
      ret += "#{count}#{old_s[i]}"
      count = 1
    end
  end
  ret
end
