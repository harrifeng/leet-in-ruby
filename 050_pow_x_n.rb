require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_050
    assert_equal 8, my_pow(2, 3)
  end
end

def my_pow(x, n)
  return positive_pow(x, n) if n >= 0
  1 / positive_pow(x, -n)
end

def positive_pow(x, n)
  return 1 if n.zero?
  ret = positive_pow(x, n / 2)
  ret *= ret
  return ret * x if n.odd?
  ret
end
