require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_093
    assert_equal ['255.255.11.135', '255.255.111.35'].sort,
                 restore_ip_addresses('25525511135')
    assert_equal ['0.10.0.10', '0.100.1.0'].sort, restore_ip_addresses('010010')
  end
end

# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
  return [] if s.length.zero?
  ret = []
  helper_093(s, [], ret)
  ret
end

def helper_093(s, tmp, ret)
  return if tmp.length > 4
  if s.length.zero? && tmp.length == 4
    ret.push(tmp.join('.'))
    return
  end

  1.upto([s.length, 3].min) do |i|
    next if (i > 1 && (s[0] == '0')) || (i == 3 && s[0...3].to_i > 255)
    tmp.push s[0...i]
    helper_093(s[i...s.length], tmp, ret)
    tmp.pop
  end
end
