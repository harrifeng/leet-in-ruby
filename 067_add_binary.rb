require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_067
    assert_equal '111', add_binary('110', '1')
    assert_equal '1001', add_binary('110', '11')
  end
end

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  carry = 0
  ret = ''
  i = a.length - 1
  j = b.length - 1

  while i >= 0 || j >= 0 || carry > 0
    cnt = carry
    if i >= 0
      cnt += a[i].to_i
      i -= 1
    end

    if j >= 0
      cnt += b[j].to_i
      j -= 1
    end

    ret += (cnt % 2).to_s
    carry = cnt / 2
  end
  ret.reverse
end
