# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :personnel, dependent: :nullify
  has_many :tires, dependent: :destroy
  validates :number, :make, :model, :year, presence: true

  def validate_tires_on_car
    return unless tires.count.positive?

    errors.add(:tires, 'cannot be in a quantity other than 4') unless tires.count == 4

    tire_positions = tires.positions
    duplicates = tire_positions.select { |e| tire_positions.count(e) > 1 }
    unique_position_duplicates = %i[left_front left_rear right_front right_rear] & duplicates

    if unique_position_duplicates
      errors.add(:tires, "cannot have duplicate #{unique_position_duplicates.join(', ')} positions")
    elsif (duplicates.count(:left_side) == 1 || duplicates.count(:right_side) == 1) && duplicates.count(:anywhere).zero?
      errors.add(:tires, "cannot have a single #{duplicates.count(:left_side) == 1 ? 'left side' : 'right side'} tire")
    end
  end
end
