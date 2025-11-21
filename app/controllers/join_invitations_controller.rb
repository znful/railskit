class JoinInvitationsController < ApplicationController
  before_action :set_invitation

  def index
    p @invitation
  end

  def create
  end

  private
  def set_invitation
    @invitation = Invitation.find_by(token: params.expect(:token))
  end
end
