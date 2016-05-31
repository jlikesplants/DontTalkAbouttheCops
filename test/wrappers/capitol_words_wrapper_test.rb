require 'test_helper'

class CapitolWordsWrapperTest < ActiveSupport::TestCase
  setup do
    @phrase = "civil rights"
  end

  test "should search for a phrase and return a table of frequency" do
    table = CapitolWordsWrapper.phrase(@phrase)
    assert_instance_of Array, table
    table.each do |row|
      assert_instance_of Hash, row
      assert_includes row.keys, "state"
      assert_instance_of String, row["state"]
      # assert row.keys.length == 2
      assert_includes row.keys, "count"
      assert_instance_of Fixnum, row["count"]
    end
  end

  test "returned table should include all states" do
    table = CapitolWordsWrapper.phrase(@phrase)
    states = table.map do |row|
      row["state"]
    end.map(&:upcase).sort
    assert_equal CapitolWordsWrapper::STATES.sort, states
  end

end
