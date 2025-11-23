class MembersController < ApplicationController
  before_action :authenticate_account_access!
  before_action :set_account
  before_action :set_member, only: %i[ show destroy update ]
  before_action :set_member_account_user, only: %i[ show destroy update edit ]
  before_action :set_current_account_user
  before_action :set_members_breadcrumbs


  def index
    add_breadcrumb "Members"
    @members = @account.users
    render layout: "settings"
  end

  def show
    add_breadcrumb "Members", account_members_path(@account)
    add_breadcrumb @member.username
    render layout: "settings"
  end

  def edit
  end

  def update
    unless @current_account_user.owner_role? || @current_account_user.admin_role?
      redirect_to account_member_path(@account, @member), alert: "You are not authorized to edit members"
      return
    end

    if @member_account_user.nil?
      redirect_to account_member_path(@account, @member), alert: "Member not found"
      return
    end

    @member_account_user.update(role: params[:role])
    redirect_to account_member_path(@account, @member), success: "Member successfully updated"
  end


  def destroy
    if @member_account_user.nil?
      redirect_to account_member_path(@account, @member), alert: "Member not found"
      return
    end

    if @member == Current.user
      @member_account_user.destroy
      redirect_to accounts_path, success: "Successfully left account"
    else
      unless @current_account_user.owner_role? || @current_account_user.admin_role?
        redirect_to account_member_path(@account, @member), alert: "You are not authorized to remove members"
        return
      end

      @member_account_user.destroy
      redirect_to account_members_path(@account), success: "Member successfully removed"
    end
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_member
    @member = @account.account_users.find_by!(user_id: params[:id]).user
  end

  def set_member_account_user
    @member_account_user = @account.account_users.find_by!(user: @member)
  end

  def set_current_account_user
    @current_account_user = AccountUser.find_by!(account: @account, user: Current.user)
  end

  def set_members_breadcrumbs
    add_breadcrumb @account.name, account_settings_path(@account)
  end
end
