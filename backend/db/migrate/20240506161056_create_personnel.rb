# frozen_string_literal: true

class CreatePersonnel < ActiveRecord::Migration[7.1]
  def change
    create_table :personnel do |t|
      t.string :name, null: false
      t.string :position

      t.belongs_to :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end
