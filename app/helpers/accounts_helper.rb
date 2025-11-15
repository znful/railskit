module AccountsHelper
  def current_account
    unless Current.account
      Current.session.update(account: Current.user.default_account)
    end
    p Current.session
    Current.account
  end
end
