# frozen_string_literal: true

FactoryBot.define do
  factory :personnel do
    name { 'John Doe' }
    position { 'Tire changer' }
    car { association :car }
  end
end
