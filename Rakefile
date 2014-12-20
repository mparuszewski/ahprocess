require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'REPL with AHProcess gem loaded'
task :console do
  $LOAD_PATH[0, 0] = File.join(File.dirname(__FILE__), 'lib')
  require 'pry'
  require 'ahprocess'

  Pry.config.prompt_name = 'AHProcess'
  Pry.start
end
