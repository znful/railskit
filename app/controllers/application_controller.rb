class ApplicationController < ActionController::Base
  include Authentication
  before_action :set_breadcrumbs
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes


  def add_breadcrumb(label, path = "")
    @breadcrumbs << { label: label, path: path }
  end

  private
  def set_breadcrumbs
    @breadcrumbs = []
  end
end
