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
      destroyed_input = @input.as_json # or try .to_json

      if @input.destroy
         render json: destroyed_input, status: :created, location: destroyed_input
      else
        render json: @input.errors, status: :unprocessable_entity
      end



    # @input = find_specific_input
    # # @input.destroy
    # if @input.destroy
    #   render json: @input, status: :created, location: @input
    # else
    #   render json: @input.errors, status: :unprocessable_entity
    # end
  end


  private

  def allowed_params
    params.require(:input).permit(:category, :url, :longitude, :latitude, :user_id, :mountain_id)
  end

  def find_specific_input
    Input.find(params[:id])
  end
end
