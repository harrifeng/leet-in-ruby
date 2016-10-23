require 'git'
require 'logger'

def get_file_last_commit(file_name)
  file_commit = `git log -1 --format=oneline -- #{file_name}`
  file_commit[0...40]
end

def get_commit_branch_list(commit_sha)
  arr_str = `git branch --contains #{commit_sha}`
  arr_str.split(' ').map{|a| a if a != '*' }.compact
end

def get_current_branch
  g = Git.open('.')
  g.branches.map{|b| b if b.current }.compact[0]
end


def get_commits_since_depart_from_master
  g = Git.open('.')
  # cur_branch = g.branches.map{|b| b if b.current }.compact[0].to_s
  cur = g.branches.map{|b| b if b.current }.compact[0]
  master = g.branches["master"]
  starter = `git merge-base #{cur.gcommit.sha} #{master.gcommit.sha}`
  starter.chop!
  arr = g.log.between(starter, 'HEAD')
end

# p get_commits_since_depart_from_master.size

def get_diff_file_list
  g = Git.open('.')
  cur = g.branches.map{|b| b if b.current }.compact[0]
  master = g.branches["master"]
  starter = `git merge-base #{cur.gcommit.sha} #{master.gcommit.sha}`
  starter.chop!

  g.gtree(starter).diff('HEAD').name_status.keys
end
p get_diff_file_list



# p cur = get_current_branch

# g = Git.open('.')
# arr = g.log.between('HEAD~6', 'HEAD')
# # arr = g.log.since('2 weeks ago')
#
# p arr.class
# arr.each do |i|
#   p i.sha
# end
# p arr.size
# puts get_current_branch
# puts get_commit_branch_list(get_file_last_commit('Gemfile'))

# g = Git.open('.', :log => Logger.new(STDOUT))
# g = Git.open('.')
#
# g.index
# g.index.readable?
# # g.log.each { |l| puts l }
# ret = g.branches.map{|b| b if b.current }.compact[0]
# master = g.branches["master"]
#
# starter = `git merge-base #{ret.gcommit.sha} #{master.gcommit.sha}`
# starter.chop!
#
# puts starter
#
# file_name = "001_two_sum.rb"
#
# file_commit = `git log -1 --format=oneline -- #{file_name}`
# file_commit = file_commit[0...40]
# puts file_commit
#
#
# ans1= `git merge-base --is-ancestor #{starter} #{file_commit} `
# ans2= `git merge-base --is-ancestor #{file_commit} #{starter} `
# ans2= `git merge-base --is-ancestor HEAD~ HEAD `
# puts "ans is #{ans1}, #{ans2}"
#
# puts `git merge-base --is-ancestor #{ret.gcommit.sha} #{master.gcommit.sha}`
# puts `git merge-base --is-ancestor #{master.gcommit.sha} #{ret.gcommit.sha} `
#
# arr_str = `git branch --contains 7411a7c53b13ea9050bc74c030036e71585837d2`
#
# arr = arr_str.split(' ').map{|a| a if a != '*' }.compact
#
# puts arr
