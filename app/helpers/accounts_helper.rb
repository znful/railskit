module AccountsHelper
  def default_account
    Current.user.accounts.first if Current.user.present?
  end
end
