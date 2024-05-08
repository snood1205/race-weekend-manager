# frozen_string_literal: true

require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    create_list :car, 3
    get cars_url
    assert_response :success
    assert_equal 3, response.parsed_body.length
  end

  test 'should get index with tires' do
    cars = create_list :car, 3
    cars.each { |car| create_list :tire, 4, on_car: true, car: }
    get cars_url, params: { tires: true }
    assert_response :success
    response.parsed_body.each do |car|
      assert_not_nil car['tires']
    end
    assert_nil response.parsed_body.first['personnel']
  end

  test 'should get index with personnel' do
    cars = create_list :car, 3
    cars.each { |car| create_list :personnel, 5, car: }
    get cars_url, params: { personnel: true }
    assert_response :success
    response.parsed_body.each do |car|
      assert_not_nil car['personnel']
    end
    assert_nil response.parsed_body.first['tires']
  end

  test 'should get index with both' do
    cars = create_list :car, 3
    cars.each do |car|
      create_list(:tire, 4, on_car: true, car:)
      create_list(:personnel, 5, car:)
    end
    get cars_url, params: { tires: true, personnel: true }
    assert_response :success
    response.parsed_body.each do |car|
      assert_not_nil car['personnel']
      assert_not_nil car['tires']
    end
  end
end
