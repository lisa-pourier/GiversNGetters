class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

  def home
  end

  def search
    @results = User.where("username ILIKE ?", "%#{params[:query]}%")
  end

  def dashboard
    @agreements_submitted = current_user.agreements_submitted
    @agreements_received = current_user.agreements
    # @requests = Request.all
  end

end
