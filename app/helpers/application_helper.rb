module ApplicationHelper
  def current_user
    Current.user if Current.user.present?
  end

  def user_signed_in?
    Current.user.present?
  end
end
