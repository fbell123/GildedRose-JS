require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end
