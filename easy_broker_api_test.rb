require 'minitest/autorun'
require_relative 'easy_broker_api'

class EasyBrokerAPITest < Minitest::Test
  def setup
    @api = EasyBrokerAPI.new
  end

  def test_fetch_properties
    properties = @api.fetch_properties
    assert properties.is_a?(Array), 'Expected an array of properties'
    refute_empty properties, 'Expected properties not to be empty'
  end

  def test_print_titles
    assert_output(/.+/) { @api.print_titles }
  end
end
