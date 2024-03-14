class AgreementsController < ApplicationController

  # submitted agreements (pending, accepted, rejected status?);
  # what about received agreements? (pending, accepted, rejected status?)

  def accept
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'accepted'
    @agreement.save
    redirect_to action: 'dashboard', controller: "pages"
  end

  def reject
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'rejected'
    @agreement.save
    redirect_to action: 'dashboard', controller: "pages"
  end

  def pending
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'pending'
    @agreement.save
    redirect_to action: 'dashboard', controller: "pages"
  end

  def completed
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'completed'
    @agreement.save
    redirect_to action: 'dashboard', controller: "pages"
  end

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

  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.destroy
    redirect_to action: 'dashboard', controller: "pages"
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
