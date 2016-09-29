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

def count_and_say(n)
  return '1' if n == 1

  s = count_and_say(n - 1) + '$'

  cnt = 1
  ret = ''
  (s.length - 1).times do |i|
    if s[i] == s[i + 1]
      cnt += 1
    else
      ret += cnt.to_s
      ret += s[i].to_s
      cnt = 1
    end
  end
  ret
end
