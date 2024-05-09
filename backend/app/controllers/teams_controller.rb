# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_team_administrator!, only: %i[create update destroy]

  def create
    team = Team.new(team_params)
    if team.save
      render json: team, status: :created
    else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      render json: team
    else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    head :no_content
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
