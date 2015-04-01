require 'test_helper'
require 'generators/ajs_page/ajs_page_generator'

class AjsPageGeneratorTest < Rails::Generators::TestCase
  tests AjsPageGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
