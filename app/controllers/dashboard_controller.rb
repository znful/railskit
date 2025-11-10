class DashboardController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account
  before_action :set_dashboard_breadcrumb

  def index
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_dashboard_breadcrumb
    add_breadcrumb "Dashboard"
  end
end
