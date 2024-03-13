class RequestsController < ApplicationController
  def index
    @requests = if params[:search]
                  Request.where('title ILIKE ?', "%#{params[:search]}%")
                else
                  Request.all
                end
  end

  def show
    @request = Request.find(params[:id])
    @suggestion = User.all.filter { |user| user.expertises.include?(@request.expertise) && user.id != current_user.id }.sample
  end

  def new
    @request = Request.new
  end


  def create
    @request = Request.new(request_params)
    @request.user = current_user
    # @request.status = "pending"
    @request.save

    if @request.save
      redirect_to requests_path, notice: 'Request successfully created!'
    else
      render :new
    end

  end

  def my_requests
    @requests = current_user.requests
  end



  private

  def request_params
    params.require(:request).permit(:title, :description, :expertise_id)
  end
end
