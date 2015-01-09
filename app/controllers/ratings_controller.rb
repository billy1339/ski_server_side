class RatingsController < ApplicationController
   def index
    @ratings = Rating.all
    render json: @ratings
  end

  def show
    @rating = find_specific_rating

    if @rating
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def create
    @rating = Rating.create(allowed_params)

     if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def update
    @rating = find_specific_rating

    if @rating.update(allowed_params)
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = find_specific_rating
      destroyed_rating = @rating.as_json # or try .to_json

    if @rating.destroy
       render json: destroyed_rating, status: :created, location: destroyed_rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end

  end


  private

  def allowed_params
    params.require(:rating).permit(:user_id, :input_id)
  end

  def find_specific_rating
    Rating.find(params[:id])
  end
end
