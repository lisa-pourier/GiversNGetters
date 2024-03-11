class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # initially had this method, but adjusted it to below to show the logged in user's requests in the dropdown when in the user's show page

  # def show
  #   @user = User.find(params[:id])
  # end

  # then used this and it worked for the display on 1 user card, the card of the logged in user, BUT not when trying to iterate

  def show
    @user = User.find(params[:id])
    # @users = User.all
    if params[:request_id].present?
      @requests = @user.requests.where(id: params[:request_id])
    else
      @requests = @user.requests
    end
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
