# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :number, null: false
      t.string :make
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
