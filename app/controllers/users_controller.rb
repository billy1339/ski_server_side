class UsersController < ApplicationController

   def index
    @users = User.all
    render json: @users
  end

  def show
    @user = find_specific_user

    if @user
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create
    @user = User.create(allowed_params)

     if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = find_specific_user

    if @user.update(allowed_params)
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = find_specific_user
      destroyed_user = @user.as_json # or try .to_json

    if @user.destroy
       render json: destroyed_user, status: :created, location: destroyed_user
    else
      render json: @user.errors, status: :unprocessable_entity
    end

  end


  private

  def allowed_params
    params.require(:user).permit(:username, :email, :password_digest, :token)
  end

  def find_specific_user
    User.find(params[:id])
  end
end
