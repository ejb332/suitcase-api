class AttiresController < ApplicationController
  def create
    @attire = Attire.new(
      item_name: params[:item_name],
      color: params[:color],
      size: params[:size],
      quantity: params[:quantity],
      category: params[:category],
      user_id: current_user.id
    )
    if @attire.save
      render json: { message: 'Item successfully added to closet!'}, status: :created
    else
      render json: { error: @attire.errors.full_messsage }, status: :unprocessable_entity
    end
  end
end
