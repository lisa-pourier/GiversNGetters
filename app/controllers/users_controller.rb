class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @agreement = Agreement.new

    if params[:request_id].present?
      @requests = @user.requests.where(id: params[:request_id])
    else
      @requests = @user.requests
    end
  end

  def profile
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_profile_path(@user), notice: 'Profile updated successfully.'
    else
      render "edit"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params

    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :about_me, expertises_attributes: [:name], interest_expertises_attributes: [:name])

    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :about_me, expertises_attributes: [:name], interest_expertises_attributes: [:name])

  end
end
