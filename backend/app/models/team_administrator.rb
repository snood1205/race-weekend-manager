# frozen_string_literal: true

class TeamAdministrator < ApplicationRecord
  has_secure_password
  belongs_to :team

  def generate_tokens!
    token_expires_at = 15.minutes.from_now
    refresh_token_expires_at = 1.week.from_now
    token = JWT.encode({ id:, expires_at: token_expires_at.to_i }, Rails.application.secret_key_base)
    refresh_token = JWT.encode({ id:, expires_at: refresh_token_expires_at.to_i }, Rails.application.secret_key_base)

    update!(token:, token_expires_at:, refresh_token:, refresh_token_expires_at:)

    { token:, refresh_token: }
  end

  def refresh_access_token!
    raise 'Refresh token is expired or invalid' unless refresh_token_expires_at > Time.zone.now

    generate_tokens!
  end
end
