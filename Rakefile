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

  File.open(rand_file, 'r') do |f|
    start = false
    while line = f.gets
      start = true if line =~ /^def/
      if start
        function.push line
      else
        question += line
      end
    end
  end

  File.open(rand_file, 'w') do |f|
    f.write(question)
    f.write(function[0])
    f.write("\n")
    f.write(function[-1])
  end

  puts "Please finish #{rand_file}"
end

desc 'rename text'
task :rename do
  py_files = Dir['txt/[0-9]*.py']
  py_files.map! do |p|
    [p, p.slice(0, 7) + ".txt"]
  end
  py_files.each do |p|
    %x[mv #{p[0]} #{p[1]}]
  end
end


task default: :test
