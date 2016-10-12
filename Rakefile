require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['./*.rb']
end

desc 'random question'
task :rand do
  rb_files = Dir['[0-9]*.rb']
  rb_files.map! do |r|
    [r.slice(0, 3).to_i, r]
  end

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
  puts "Please finish #{rand_file}"
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
  puts "Please finish #{rand_file}"
end

task default: :test
