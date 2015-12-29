require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_two_sum
    assert_equal "PAHNAPLSIIGYIR", convert("PAYPALISHIRING", 3)
    assert_equal "A", convert("A", 1)
    assert_equal "ACB", convert("ABC", 2)
    assert_equal "AB", convert("AB", 1)
  end
end


# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  if num_rows == 1
    return s
  end
  group = num_rows * 2 - 2
  rows = [""] * num_rows
  i = 0
  while i < s.length do
    r = i % group
    if r < num_rows
      rows[r] += s[i]
    else
      rows[group - r] += s[i]
    end
    i += 1
  end
  rows.inject(:+)
end
