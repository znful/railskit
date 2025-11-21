class JoinInvitationsController < ApplicationController
  before_action :set_invitation
  before_action :redirect_members, only: %i[ create ]
  before_action :redirect_unexpected_user, only: %i[ index create ]

  def index
  end

  def create
    account_user = AccountUser.new(user: Current.user, account: @invitation.account)

    if account_user.save
      @invitation.destroy!
      redirect_to account_dashboard_path(@invitation.account), notice: "Successfully joined #{@invitation.account.name}"
    else
      render :new, notice: "Error joining account. Please try again."
    end
  end

  private
  def set_invitation
    @invitation = Invitation.find_by(token: params.expect(:token))
  end

  def redirect_members
    redirect_to account_dashboard_path(@invitation.account), notice: "You are already a member of this account" if AccountUser.where(account: @invitation.account, user: Current.user).exists?
  end

  def redirect_unexpected_user
    redirect_to account_dashboard_path(Current.user.default_account), alert: "Invalid invite link." if Current.user.email_address != @invitation.receiver
  end
end
