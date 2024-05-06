# frozen_string_literal: true

require 'test_helper'

class TireTest < ActiveSupport::TestCase
  test '#validate_laps_on_tire' do
    tire = create(:tire, laps_on_tire: 5)
    tire.laps_on_tire = 4
    assert_not tire.save
    assert_equal ['cannot be decreased'], tire.errors.messages[:laps_on_tire]
  end

  test 'it will not create a tire with a negative laps_on_tire' do
    tire = build(:tire, laps_on_tire: -1)
    assert_not tire.save
    assert_equal ['must be greater than or equal to 0'], tire.errors.messages[:laps_on_tire]
  end
end
