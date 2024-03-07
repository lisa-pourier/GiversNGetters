class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

  def home
  end

  def search
    @results = User.where("username ILIKE ?", "%#{params[:query]}%")
  end
end
