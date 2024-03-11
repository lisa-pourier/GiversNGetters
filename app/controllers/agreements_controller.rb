class AgreementsController < ApplicationController

  # submitted agreements (pending, accepted, rejected status?);
  # what about received agreements? (pending, accepted, rejected status?)

  def index
    @agreements = Agreement.all
    render template: '/dashboard'
    # @dashboards = Dashboard.all
  end

  def show
    @agreement = Agreement.find(params[:id])
    #@dashboard = Dashboard.find(params[:id])
  end

  def new
    @agreement = Agreement.new
  end

  def create
    @agreement = Agreement.new(status: 'pending', request_id: params[:agreement][:request_id], sender_id: params[:agreement][:sender_id], receiver_id: params[:agreement][:receiver_id])
    if @agreement.save
      redirect_to action:'dashboard', controller: "pages"# change to redirect to dashboard
    end
  end

  private

  def request_params
    params.require(:agreement).permit(:sender_id, :receiver_id, :request_id)
  end
end
