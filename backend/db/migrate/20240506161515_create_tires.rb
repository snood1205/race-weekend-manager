# frozen_string_literal: true

class CreateTires < ActiveRecord::Migration[7.1]
  def change
    create_table :tires do |t|
      t.integer :position
      t.string :serial_number
      t.string :manufacturer
      t.integer :compound
      t.boolean :on_car, default: false, null: false
      t.integer :laps_on_tire, default: 0, null: false

      t.belongs_to :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end
