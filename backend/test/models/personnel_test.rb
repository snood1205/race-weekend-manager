# frozen_string_literal: true

require 'test_helper'

class PersonnelTest < ActiveSupport::TestCase
  test 'it will not create a personnel with no name' do
    personnel = build(:personnel, name: nil)
    assert_not personnel.save
    assert_equal ["can't be blank"], personnel.errors.messages[:name]
  end
end