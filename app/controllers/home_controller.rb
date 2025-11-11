class HomeController < ApplicationController
  allow_unauthenticated_access

  def index
    render layout: "landing"
  end
end
