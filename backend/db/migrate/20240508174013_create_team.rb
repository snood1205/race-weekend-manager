# frozen_string_literal: true

class CreateTeam < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false

      t.timestamps
    end

    change_table :cars do |t|
      t.belongs_to :team, null: false, foreign_key: true
    end

    change_table :personnel do |t|
      t.belongs_to :team, null: false, foreign_key: true
    end
  end
end
