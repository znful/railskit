class DashboardController < ApplicationController
  before_action :set_dashboard_breadcrumb
  def index
  end

  private
  def set_dashboard_breadcrumb
    add_breadcrumb "Dashboard"
  end
end
