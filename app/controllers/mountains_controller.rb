class MountainsController < ApplicationController

   def index
    @mountains = Mountain.all
    render json: @mountains, :include => [:inputs => {:include => [:descriptions, :flags, :ratings]}]
  end

  def show
    @mountain = find_specific_mountain

    if @mountain
      render json: @mountain, :include => [:inputs => {:include => [:descriptions, :flags, :ratings]}], status: :created, location: @mountain
    else
      render json: @mountain.errors, status: :unprocessable_entity
    end
  end

  def create
    @mountain = Mountain.create(allowed_params)

     if @mountain.save
      render json: @mountain, status: :created, location: @mountain
    else
      render json: @mountain.errors, status: :unprocessable_entity
    end
  end

  def update
    @mountain = find_specific_mountain

    if @mountain.update(allowed_params)
      render json: @mountain, status: :created, location: @mountain
    else
      render json: @mountain.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mountain = find_specific_mountain
      destroyed_mountain = @mountain.as_json # or try .to_json

    if @mountain.destroy
       render json: destroyed_mountain, status: :created, location: destroyed_mountain
    else
      render json: @mountain.errors, status: :unprocessable_entity
    end

    # @mountain = find_specific_mountain

    # if @mountain.destroy
    #   render json: @mountain, status: :created, location: @mountain
    # else
    #   render json: @mountain.errors, status: :unprocessable_entity
    # end
  end


  private

  def allowed_params
    params.require(:mountain).permit(:name, :longitude, :latitude)
  end

  def find_specific_mountain
    Mountain.find(params[:id])
  end

end
