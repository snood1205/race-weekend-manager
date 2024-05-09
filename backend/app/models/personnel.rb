# frozen_string_literal: true

class Personnel < ApplicationRecord
  belongs_to :car

  validates :name, presence: true

  self.table_name = 'personnel'
end
