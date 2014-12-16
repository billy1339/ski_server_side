class InputsController < ApplicationController
   def index
    @inputs = Input.all
    render json: @inputs, :include => [:descriptions, :ratings, :flags]
  end

  def show
    @input = find_specific_input

    if @input
      render json: @input, status: :created, location: @input
    else
      render json: @input.errors, status: :unprocessable_entity
    end
  end

  def create
    @input = Input.create(allowed_params)

     if @input.save
      render json: @input, status: :created, location: @input
    else
      render json: @input.errors, status: :unprocessable_entity
    end
  end

  def update
    @input = find_specific_input

    if @input.update(allowed_params)
      render json: @input, status: :created, location: @input
    else
      render json: @input.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @input = find_specific_input

    if @input.destroy
      render json: @input, status: :created, location: @input
    else
      render json: @input.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    params.require(:input).permit(:category, :longitude, :latitude, :user_id, :mountain_id)
  end

  def find_specific_input
    Input.find(params[:id])
  end
end
