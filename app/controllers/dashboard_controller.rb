class DashboardController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account

  def index
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end
end
