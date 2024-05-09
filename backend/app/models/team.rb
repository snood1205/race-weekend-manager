# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :personnel, dependent: :destroy
  has_many :team_administrators, dependent: :destroy
  has_many :tires, through: :cars
end
