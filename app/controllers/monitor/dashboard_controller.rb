class Monitor::DashboardController < ApplicationController

  respond_to :html
  before_filter :authenticate_user!

  def index
    @organisations = current_user.organisations.includes(:sites)
    respond_with(@organisations)
  end

  def show
    @site = Site.includes(:places).find(params[:id])
    respond_with(@site)
  end
end
