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
    @agreement = Agreement.new(agreement_params)
    if @agreement.save
      redirect_to @agreement # change to redirect to dashboard
    else
      render 'new'
    end
  end


end
