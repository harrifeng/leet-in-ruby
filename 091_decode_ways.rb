require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_091
    assert_equal(3, num_decodings('123'))
    assert_equal(0, num_decodings('00'))
    assert_equal(1, num_decodings('10'))
    assert_equal(1, num_decodings('20'))
    assert_equal(1, num_decodings('27'))
    assert_equal(1, num_decodings('1'))
    assert_equal(0, num_decodings('100'))
    assert_equal(1, num_decodings('101'))
    assert_equal(1, num_decodings('110'))
    assert_equal(0, num_decodings('301'))
    assert_equal(0, num_decodings('01'))
    assert_equal(0, num_decodings('230'))
  end
end

# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.length.zero? || s[0] == '0'
  dp = Array.new(s.length + 1, 0)
  dp[0] = 1
  dp[1] = 1

  2.upto(s.length) do |i|
    if s[i - 1] == '0'
      dp[i] = %w(1 2).include?(s[i - 2]) ? dp[i - 2] : 0
    else
      dp[i] = if s[i - 2] != '0' && s.slice(i - 2, 2).to_i <= 26
                (dp[i - 1] + dp[i - 2])
              else
                dp[i - 1]
              end
    end
  end
  dp[-1]
end
