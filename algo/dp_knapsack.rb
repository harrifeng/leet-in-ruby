require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30],
                  [0, 0, 0, 0, 30, 30, 30, 30, 30, 50, 50, 50, 50, 50, 50, 50, 50],
                  [0, 0, 0, 0, 30, 30, 30, 30, 30, 50, 50, 50, 50, 50, 70, 70, 70],
                  [0, 0, 0, 10, 30, 30, 30, 40, 40, 50, 50, 50, 60, 60, 70, 70, 70]],
                 dp_array([30, 20, 40, 10], [4, 5, 10, 3], 16)
  end
end

# @param [Integer] v
# @param [Integer] w
# @return [][] dp
def dp_array(v, w, maxW)
  d = []
  len = v.length
  for i in (0..len)
    d << []
    for j in (0..maxW)
      d[i][j] = ((i == 0) ? 0 : d[i-1][j])
      if i > 0 && j >= w[i-1]
        d[i][j] = [d[i-1][j], d[i-1][j - w[i-1]] + v[i-1]].max
      end
    end
  end
  return d
end
