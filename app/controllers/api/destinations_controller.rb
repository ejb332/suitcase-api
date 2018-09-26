class Api::DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    render 'index.json.jbuilder'
  end

  def create
    @destination = Destination.new(
      city: params[:city],
      country: params[:country],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    @destination.save
    render 'show.json.jbuilder'
  end

  def show
    @destination = Destination.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @destination = Destination.find_by(id: params[:id])
    @destination.city = params[:city] || @destination.city
    @destination.country = params[:country] || @destination.country
    @destination.start_date = params[:start_date] || @destination.start_date
    @destination.end_date = params[:end_date] || @destination.end_date
    @destination.save
    render 'show.json.jbuilder'
  end

  def destroy
    destination = Destination.find_by(id: params[:id])
    destination.destroy
    render json: {message: 'Destination removed from trips.'}
  end
end
