require 'test_helper'

class RateauxTest < ActiveSupport::TestCase
  test "version" do
    assert_kind_of Module, Rateaux
    assert_kind_of String, Rateaux::VERSION
  end
end
