require 'blackjack'

RSpec.configure do |config|
  config.default_formatter = 'doc' if config.files_to_run.one?
end
