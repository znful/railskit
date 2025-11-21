class InvitationsController < ApplicationController
  before_action :set_account
  before_action :set_invitation, only: %i[ show edit update destroy ]
  before_action :set_account_breadcrumb
  before_action :set_invitation_breadcrumbs, except: %i[ index ]

  # GET /inivitations or /inivitations.json
  def index
    add_breadcrumb "Invitations"
    @invitations = @account.invitations
    render layout: "settings"
  end

  # GET /inivitations/1 or /inivitations/1.json
  def show
    add_breadcrumb "Detail"
    render layout: "settings"
  end

  # GET /inivitations/new
  def new
    add_breadcrumb "New invitation"
    @invitation = Invitation.new
    render layout: "settings"
  end

  # GET /inivitations/1/edit
  def edit
    add_breadcrumb "Edit invitation"
    render layout: "settings"
  end

  # POST /inivitations or /inivitations.json
  def create
    add_breadcrumb "New invitation"
    @invitation = Invitation.new(invitation_params)
    @invitation.account = @account
    @invitation.token = SecureRandom.hex(10)
    @invitation.sender = Current.user


    respond_to do |format|
      if @invitation.save
        format.html { redirect_to [ @account, @invitation ], notice: "Invitation was successfully created." }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new, status: :unprocessable_entity, layout: "settings" }
        format.json { render json: @invtation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inivitations/1 or /inivitations/1.json
  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to account_invitation_path(@account, @invitation), notice: "Invitation was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invtation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inivitations/1 or /inivitations/1.json
  def destroy
    @invitation.destroy!

    respond_to do |format|
      format.html { redirect_to account_invitations_path(@account), notice: "Invitation was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params.expect(:id))
    end

    def set_account
      @account = Account.find_by!(slug: params.expect(:account_slug))
    end

    def set_account_breadcrumb
      add_breadcrumb @account.name, account_settings_path(@account)
    end

    def set_invitation_breadcrumbs
      add_breadcrumb "Invitations", account_invitations_path(@account)
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.expect(invitation: [ :account_id, :message, :receiver ])
    end
end
