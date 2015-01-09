class FlagsController < ApplicationController
   def index
    @flags = Flag.all
    render json: @flags
  end

  def show
    @flag = find_specific_flag

    if @flag
      render json: @flag, status: :created, location: @flag
    else
      render json: @flag.errors, status: :unprocessable_entity
    end
  end

  def create
    @flag = Flag.create(allowed_params)

     if @flag.save
      render json: @flag, status: :created, location: @flag
    else
      render json: @flag.errors, status: :unprocessable_entity
    end
  end

  def update
    @flag = find_specific_flag

    if @flag.update(allowed_params)
      render json: @flag, status: :created, location: @flag
    else
      render json: @flag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @flag = find_specific_flag
      destroyed_flag = @flag.as_json # or try .to_json

    if @flag.destroy
       render json: destroyed_flag, status: :created, location: destroyed_flag
    else
      render json: @flag.errors, status: :unprocessable_entity
    end

  end


  private

  def allowed_params
    params.require(:flag).permit(:user_id, :input_id)
  end

  def find_specific_flag
    Flag.find(params[:id])
  end
end
