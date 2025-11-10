class MembersController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account
  before_action :set_member, only: %i[ show ]


  def index
    @members = @account.users
  end

  def show
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_member
    @member = @account.account_users.find_by!(user_id: params[:id]).user
  end
end
