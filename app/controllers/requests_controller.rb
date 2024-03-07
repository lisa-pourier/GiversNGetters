class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
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
      flash[:success] = "Request successfully created!"
      redirect_to requests_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :expertise_id)
  end
end
