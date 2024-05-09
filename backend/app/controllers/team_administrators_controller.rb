# frozen_string_literal: true

class TeamAdministratorsController < ApplicationController
  def login
    admin = TeamAdministrator.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      tokens = admin.generate_tokens!
      render json: tokens
    else
      # Do not differentiate between email and password error to not expose email addresses
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
