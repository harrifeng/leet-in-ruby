require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_071
    assert_equal('/home', simplify_path('/home/'))
    assert_equal('/', simplify_path('/home/../../../'))
    assert_equal('/', simplify_path('///'))
    assert_equal('/c', simplify_path('/a/./b/../../c/'))
    assert_equal('/home/foo', simplify_path('/home//foo/'))
  end
end

# @param {String} path
# @return {String}
def simplify_path(path)
  raw_arr = path.split('/').delete_if { |c| c == '/' || c == '' }
  stack = []
  raw_arr.each do |c|
    case c
    when '.'
      next
    when '..'
      stack.pop unless stack.empty?
    else
      stack.push c
    end
  end
  '/' + stack.join('/')
end
