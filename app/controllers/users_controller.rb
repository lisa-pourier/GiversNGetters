class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index # aka users: this is the method that will be called when the user goes to the /users page
    @users = User.all
    
  end

  def show # aka user: this is the method that will be called when the user goes to the /users/:id page
    @user = User.find(params[:id])
  end
end
