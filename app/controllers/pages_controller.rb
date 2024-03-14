class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home, :search ]
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def search
    @results = User.where("username ILIKE ?", "%#{params[:query]}%")
  end

  def dashboard
    @current_user = current_user
    @requests_unassigned = current_user.requests.filter { |request| request.agreements.empty? }
    # @agreements_submitted = current_user.agreements
    # @agreements_received = current_user.requests.flat_map do |request|
    #   request.agreements
    # end
    # @requests = Request.all
  end

  def terms
  end

  def privacy
  end

end
