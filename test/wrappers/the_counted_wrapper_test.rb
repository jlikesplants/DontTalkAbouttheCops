require 'test_helper'

class TheCountedWrapperTest < ActiveSupport::TestCase
  setup do
    @year = "2015"
  end

  test "should search for a year and return a table of fatality data" do
    table = TheCountedWrapper.year(@year)
    assert_instance_of Array, table
    table.each do |row|
      assert_instance_of Hash, row
      assert_includes row.keys, :year
      assert_instance_of String, row[:year]
    end
  end

  test "should return data only from the year requested" do
    table = TheCountedWrapper.year(@year)
    table.each do |row|
      assert_equal @year, row[:year]
    end
  end
end
