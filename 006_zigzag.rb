require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_006
    assert_equal 'PAHNAPLSIIGYIR', convert('PAYPALISHIRING', 3)
    assert_equal 'A', convert('A', 1)
    assert_equal '', convert('', 2)
  end
end

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows <= 1
  ret = [''] * num_rows
  group = 2 * num_rows - 2

  s.length.times do |i|
    cur = i % group
    if cur < num_rows
      ret[cur] += s[i]
    else
      ret[group - cur] += s[i]
    end
  end
  ret.join('')
end
