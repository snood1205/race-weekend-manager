# frozen_string_literal: true

class ApplicationController < ActionController::API
  protected

  def authenticate_team_administrator!
    token = request.headers['Authorization']
    return render json: { error: 'Missing Authorization header' }, status: :unauthorized unless token

    begin
      payload = JWT.decode(token, Rails.application.secret_key_base).first
    rescue JWT::DecodeError
      return render json: { error: 'Invalid token' }, status: :unauthorized
    end

    @current_team_administrator = TeamAdministrator.find_by(id: payload['team_administrator_id'])
    render json: { error: 'Invalid token' }, status: :unauthorized unless @current_team_administrator
  end
end
