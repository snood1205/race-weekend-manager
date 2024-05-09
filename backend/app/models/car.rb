# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :personnel, dependent: :destroy
  has_many :tires, dependent: :destroy, autosave: true

  validate :validate_tires_on_car
  validates :number, presence: true

  private

  def basic_tire_validation
    tires_on_car = tires.reload.select(&:on_car?)
    return false unless tires_on_car.count.positive?

    if tires_on_car.count == 4
      true
    else
      errors.add(:tires, 'cannot be in a quantity other than 4') && false
    end
  end

  def validate_tires_on_car
    return unless basic_tire_validation

    tire_positions = tires.select(&:on_car?).positions
    duplicates = tire_positions.select { |position| tire_positions.count(position) > 1 }
    unique_position_duplicates = %i[left_front left_rear right_front right_rear] & duplicates

    if unique_position_duplicates
      errors.add(:tires, "cannot have duplicate #{unique_position_duplicates.join(', ')} positions")
    elsif (duplicates.count(:left_side) == 1 || duplicates.count(:right_side) == 1) && duplicates.count(:anywhere).zero?
      errors.add(:tires, "cannot have a single #{duplicates.count(:left_side) == 1 ? 'left side' : 'right side'} tire")
    end
  end
end
