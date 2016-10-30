require 'rake/testtask'
require 'git'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['./*.rb']
end

def get_diff_file_list
  g = Git.open('.')
  cur = g.branches.map{|b| b if b.current }.compact[0]
  master = g.branches["master"]
  starter = `git merge-base #{cur.gcommit.sha} #{master.gcommit.sha}`
  starter.chop!

  g.gtree(starter).diff('HEAD').name_status.keys
end

def pick_question_from_none_master_branch
  rb_raw_files = Dir['[0-9]*.rb']
  change_files = get_diff_file_list
  if change_files.length.zero?
    puts "==============================================================================="
    puts 'You are current on branch [master], or your branch do not have diff question with master branch'
    puts "==============================================================================="
    return
  end
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
  File.open("txt/#{rand_file.slice(0,3)}.txt", "r") do |file|
    while line = file.gets
      puts line
    end
  end
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

desc 'random question'
task :rand do
  pick_question_from_none_master_branch
end

task default: :test
