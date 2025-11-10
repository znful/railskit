class DashboardController < ApplicationController
  before_action :authenticate_account_access!

  def index
  end
end
