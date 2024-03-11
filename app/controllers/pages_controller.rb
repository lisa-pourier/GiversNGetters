class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

  def home
  end

  def search
    @results = User.where("username ILIKE ?", "%#{params[:query]}%")
  end

  def dashboard
    # @agreements_submitted = current_user.agreements
    # @agreements_received = current_user.requests.flat_map do |request|
    #   request.agreements
    # end
    # @requests = Request.all
  end

end
