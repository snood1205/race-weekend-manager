# frozen_string_literal: true

FactoryBot.define do
  factory :team_administrator do
    name { 'MyString' }
    email { 'MyString' }
    password_hash { 'MyString' }
    team { nil }
  end
end
