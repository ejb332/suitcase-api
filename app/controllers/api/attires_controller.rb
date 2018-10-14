class Api::AttiresController < ApplicationController
  def create
    @attire = Attire.new(
      item_name: params[:item_name],
      color: params[:color],
      category: params[:category],
      user_id: current_user.id
    )
    if @attire.save
      render json: { message: 'Item successfully added! '}, status: :created
    else
      render json: { errors: @attire.errors.full_message }, status: :unprocessable_entity
    end
  end
end
