class MembersController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account
  before_action :set_member, only: %i[ show destroy update ]
  before_action :set_account_user, only: %i[ show destroy update edit ]
  before_action :set_current_account_user


  def index
    @members = @account.users
  end

  def show
  end

  def edit
  end

  def update
    if @account_user.nil?
      redirect_to account_member_path(@account, @member), alert: "Member not found"
      return
    end

    @account_user.update(role: params[:role])
    redirect_to account_member_path(@account, @member), alert: "Member successfully updated"
  end


  def destroy
    unless @current_account_user.owner_role? || @current_account_user.admin_role?
      redirect_to account_member_path(@account, @member), alert: "You are not authorized to remove members"
      return
    end


    if @account_user.nil?
      redirect_to account_member_path(@account, @member), alert: "Member not found"
      return
    end

    @account_user.destroy
    redirect_to account_members_path(@account), alert: "Member successfully removed"
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_member
    @member = @account.account_users.find_by!(user_id: params[:id]).user
  end

  def set_account_user
    @account_user = @account.account_users.find_by!(user: @member)
  end

  def set_current_account_user
    @current_account_user = AccountUser.find_by!(account: @account, user: Current.user)
  end
end
