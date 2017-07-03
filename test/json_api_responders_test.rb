require 'test_helper'

class JsonApiResponders::Test < ActiveSupport::TestCase
  test 'json_api_responder is a module' do
    assert_kind_of Module, JsonApiResponders
  end
end
