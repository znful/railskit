class HomeController < ApplicationController
  before_action :allow_unauthenticated_access
  def index
  end
end
