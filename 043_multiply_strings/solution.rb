require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    #assert_equal "24", multiply("4", "6")
    assert_equal "2400", multiply("40", "60")
    assert_equal "0", multiply("40", "0")
    assert_equal "1", multiply("1", "1")
    assert_equal "56088", multiply("123", "456")
    assert_equal "998001", multiply("999", "999")
    assert_equal "121932631112635269", multiply("123456789", "987654321")
  end
end

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  ret = [0] * (num1.length + num2.length + 1)
  tmp = [0] * (num1.length + num2.length + 1)
  num1.reverse!
  num2.reverse!

  maxp = 0
  for i in (0..num1.length-1)
    for j in (0..num2.length-1)
      pos = i + j
      val = num1[i].to_i * num2[j].to_i
      ret[pos] += val % 10
      ret[pos+1] += val / 10
    end
  end

  if ret == tmp
    return "0"
  end

  result = ""
  carry = 0
  start = ret.length-1

  while start >= 0 do
    if ret[start] != 0
      break
    end
    start -= 1
  end


  for i in (0..start)
    val = ret[i] + carry
    result << (val % 10).to_s
    carry = val / 10
  end

  if carry > 0
    result << carry.to_s
  end
  return result.reverse
end
