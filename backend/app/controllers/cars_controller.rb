# frozen_string_literal: true

class CarsController < ApplicationController
  def index
    record, include = handle_params(Car.all)
    render json: record.as_json(include:)
  end

  def show
    record, include = handle_params(Car.find(params[:id]))
    render json: record.as_json(include:)
  end

  def tires
    car = Car.find(params[:car_id]).includes('tires')
    record json: car.as_json(include: %w[tires])
  end

  private

  def handle_params(record)
    include = []
    %w[tires personnel].each do |association|
      next unless params[association]

      record = record.includes(association)
      record = record.where('tires.on_car': true) if association == 'tires'
      include << association
    end
    [record, include]
  end
end
