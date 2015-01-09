class DescriptionsController < ApplicationController

  def index
    @descriptions = Description.all
    render json: @descriptions
  end

  def show
    @description = find_specific_description

    if @description
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  def create
    @description = Description.create(allowed_params)

     if @description.save
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  def update
    @description = find_specific_description

    if @description.update(allowed_params)
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @description = find_specific_description
      destroyed_description = @description.as_json # or try .to_json

    if @description.destroy
       render json: destroyed_description, status: :created, location: destroyed_description
    else
      render json: @description.errors, status: :unprocessable_entity
    end

  end


  private

  def allowed_params
    params.require(:description).permit(:body, :user_id, :input_id)
  end

  def find_specific_description
    Description.find(params[:id])
  end


end
