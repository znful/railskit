class MembersController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account
  before_action :set_member, only: %i[ show destroy ]
  before_action :set_current_account_user


  def index
    @members = @account.users
  end

  def show
  end

  def destroy
    unless @current_account_user.owner_role? || @current_account_user.admin_role?
      redirect_to account_member_path(@account, @member)
      return
    end

    account_user = @account.account_users.find_by(user: @member)

    if account_user.nil?
      redirect_to account_member_path(@account, @member)
      return
    end

    account_user.destroy
    redirect_to account_members_path(@account)
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_member
    @member = @account.account_users.find_by!(user_id: params[:id]).user
  end

  def set_current_account_user
    @current_account_user = AccountUser.find_by(account: @account, user: Current.user)
  end
end
