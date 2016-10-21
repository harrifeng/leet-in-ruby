require 'git'
require 'logger'

g = Git.open('.', :log => Logger.new(STDOUT))
g = Git.open('.')

g.index
g.index.readable?
# g.log.each { |l| puts l }
ret = g.branches.map{|b| b if b.current }.compact[0]
master = g.branches["master"]

starter = `git merge-base #{ret.gcommit.sha} #{master.gcommit.sha}`
starter.chop!

puts `git diff #{starter} #{ret.gcommit.sha}  --stat`

# bb =  `git merge-base --is-ancestor #{ret.gcommit.sha} #{master.gcommit.sha}`
# puts bb.length
#
#
# cc =  `git merge-base --is-ancestor #{aa} #{ret.gcommit.sha}`
# puts cc.length
