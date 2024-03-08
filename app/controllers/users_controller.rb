class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  # def new
  #   @user = User.new
  # end
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  # private
  #   def user_params
  #     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  #   end
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :about_me, expertises_attributes: [:name], interest_expertises_attributes: [:name])
  end
end
