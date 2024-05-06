# frozen_string_literal: true

class Tire < ApplicationRecord
  belongs_to :car
  validate :validate_laps_on_tire, on: :update
  # This is not needed on update because of the first validation
  validates :laps_on_tire, numericality: { greater_than_or_equal_to: 0 }, on: :create
  enum position: { left_front: 0, right_front: 1, left_rear: 2, right_rear: 3, left_side: 4, right_side: 5,
                   anywhere: 6 }
  enum compound: { soft: 0, medium: 1, hard: 2, intermediates: 3, rain: 4, standard: 5, alternates: 6 }

  private

  def validate_laps_on_tire
    errors.add(:laps_on_tire, 'cannot be decreased') if laps_on_tire < laps_on_tire_was
  end
end
