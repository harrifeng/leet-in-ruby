# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"], letter_combinations("23")
  end
end

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  if digits.length == 0
    return []
  end

  ret = []
  helper(digits, ret, "", 0)
  return ret
end

$phone_num = {
  "2" => "abc",
  "3" => "def",
  "4" => "ghi",
  "5" => "jkl",
  "6" => "mno",
  "7" => "pqrs",
  "8" => "tuv",
  "9" => "wxyz"
}


# @param {String[]}nums
# @param {String[]} ret
# @param {String} current
# @param {int} depth
# @return {void}
def helper(nums, ret, current, depth)
  if depth == nums.length
    ret << current
    return
  end
  nows = $phone_num[nums[depth]]

  for i in (0..nows.length-1) do
    current += nows[i]
    helper(nums, ret, current, depth+1)
    current = current[0..-2]
  end
end
