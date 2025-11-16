module AccountsHelper
  def current_account
    unless Current.account
      Current.session.update(account: Current.user.default_account)
    end
    Current.account
  end

  def current_user_accounts
    Current.user.accounts
  end
end
