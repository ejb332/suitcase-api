class Api::DestinationsController < ApplicationController
  before_action :authenticate_user

  def index
    @destinations = Destination.all

    if params[:search]
      @destinations = @destinations.where(
        "city ILIKE ? OR country ILIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%"
      )
    end

    render 'index.json.jbuilder'
  end

  def create
    @destination = Destination.new(
      city: params[:city],
      country: params[:country],
      start_date: params[:start_date],
      end_date: params[:end_date],
      user_id: current_user.id
    )
    if @destination.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @destination.errors.full_message}, status: :unprocessable_entity
    end
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
    if @destination.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @destination.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    destination = Destination.find_by(id: params[:id])
    destination.destroy
    render json: {message: 'Destination removed from trips.'}
  end
end
