module UserHelper
  def account_user(account, user)
    AccountUser.find_by(account: account, user: user)
  end
end
