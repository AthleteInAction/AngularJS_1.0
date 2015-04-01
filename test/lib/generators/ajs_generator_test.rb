require 'test_helper'
require 'generators/ajs/ajs_generator'

class AjsGeneratorTest < Rails::Generators::TestCase
  tests AjsGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
