class JoinInvitationsController < ApplicationController
  before_action :set_invitation
  before_action :redirect_members, only: %i[ create ]

  def index
  end

  def create
  end

  private
  def set_invitation
    @invitation = Invitation.find_by(token: params.expect(:token))
  end

  def redirect_members
    redirect_to account_dashboard_path(@invitation.account), notice: "You are already a member of this account" if AccountUser.where(account: @invitation.account, user: Current.user).exists?
  end
end
