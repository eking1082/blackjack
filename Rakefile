lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rspec/core/rake_task'
require 'blackjack'
require 'pry'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Play an automated game of blackjack'
task :play_game do
  table = Blackjack::Table.new
  table.play
  table.report_results
end
