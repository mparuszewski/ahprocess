require 'bundler/setup'
Bundler.setup

require 'ahprocess'

RSpec.configure do |config|
  config.default_formatter = 'doc' if config.files_to_run.one?

   config.profile_examples = 10
   config.order = :random

   Kernel.srand config.seed
end
