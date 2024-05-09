# frozen_string_literal: true

class CreateTeamAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :team_administrators do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest
      t.string :token
      t.datetime :token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
    add_index :team_administrators, :email
    add_index :team_administrators, :token, unique: true
    add_index :team_administrators, :refresh_token, unique: true
  end
end
