# frozen_string_literal: true

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test 'it will not create a car without a number' do
    car = build(:car, number: nil)
    assert_not car.save
    assert_equal ["can't be blank"], car.errors.messages[:number]
  end

  test 'it will not create a car with less than 4 tires' do
    car = create(:car)
    create(:tire, on_car: true, car:)
    assert_not car.valid?
    assert_equal ['cannot be in a quantity other than 4'], car.errors.messages[:tires]
  end

  test 'it will not create a car with more than 4 tires' do
    car = create(:car)
    create_list(:tire, 5, on_car: true, car:)
    assert_not car.valid?
    assert_equal ['cannot be in a quantity other than 4'], car.errors.messages[:tires]
  end
end
