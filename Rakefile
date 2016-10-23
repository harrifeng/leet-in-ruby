require 'rake/testtask'
require 'git'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['./*.rb']
end

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
  g.branches.map{|b| b if b.current }.compact[0].to_s
end

def get_diff_file_list
  g = Git.open('.')
  cur = g.branches.map{|b| b if b.current }.compact[0]
  master = g.branches["master"]
  starter = `git merge-base #{cur.gcommit.sha} #{master.gcommit.sha}`
  starter.chop!

  g.gtree(starter).diff('HEAD').name_status.keys
end

desc 'random question'
task :rand do
  rb_raw_files = Dir['[0-9]*.rb']
  change_files = get_diff_file_list
  rb_files = rb_raw_files.map { |r|
    if change_files.include?(r)
      nil
    else
      [r.slice(0, 3).to_i, r]
    end
  }.compact

  puts "==============================================================================="
  puts "Still have #{rb_files.length} / #{rb_raw_files.length} to finish this round! Fighting!!"
  puts "==============================================================================="

  rand_file = rb_files[(rand * rb_files.size).to_i][1]

  question = ''
  function = []
  function_para = []

  File.open(rand_file, 'r') do |f|
    start = false
    start_para = false
    while line = f.gets
      start = true if line =~ /^def/
      start_para = true if line =~ /\# @/
      if start
        function.push line
      elsif start_para
        function_para.push line
      else
        question += line
      end
    end
  end

  File.open(rand_file, 'w') do |f|
    f.write(question)
    80.times { f.write("\n") }
    f.write(function_para.join(''))
    f.write(function[0])
    f.write("\n")
    f.write(function[-1])
  end

  puts ''
  puts ''
  puts '              Question                           '
  puts '-------------------------------------------------'
  puts `cat txt/#{rand_file.slice(0, 3)}.txt`
  puts '-------------------------------------------------'
  puts ''
  puts ''
  puts '              Last Commit                        '
  puts '-------------------------------------------------'
  puts `git log -1 -- #{rand_file}`
  puts ''
  puts ''
  puts "Please finish [#{rand_file}]"
end

task default: :test
