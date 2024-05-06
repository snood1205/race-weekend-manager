# frozen_string_literal: true

FactoryBot.define do
  factory :tire do
    position { :anywhere }
    serial_number { 'AB S0 ANYW 0524' }
    manufacturer { 'Pirelli' }
    compound { :hard }
    on_car { false }
    laps_on_tire { 0 }
    car { association :car }
  end
end
