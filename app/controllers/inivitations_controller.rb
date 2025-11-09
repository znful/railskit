class InivitationsController < ApplicationController
  before_action :set_inivitation, only: %i[ show edit update destroy ]

  # GET /inivitations or /inivitations.json
  def index
    @inivitations = Inivitation.all
  end

  # GET /inivitations/1 or /inivitations/1.json
  def show
  end

  # GET /inivitations/new
  def new
    @inivitation = Inivitation.new
  end

  # GET /inivitations/1/edit
  def edit
  end

  # POST /inivitations or /inivitations.json
  def create
    @inivitation = Inivitation.new(inivitation_params)

    respond_to do |format|
      if @inivitation.save
        format.html { redirect_to @inivitation, notice: "Inivitation was successfully created." }
        format.json { render :show, status: :created, location: @inivitation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inivitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inivitations/1 or /inivitations/1.json
  def update
    respond_to do |format|
      if @inivitation.update(inivitation_params)
        format.html { redirect_to @inivitation, notice: "Inivitation was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @inivitation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inivitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inivitations/1 or /inivitations/1.json
  def destroy
    @inivitation.destroy!

    respond_to do |format|
      format.html { redirect_to inivitations_path, notice: "Inivitation was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inivitation
      @inivitation = Inivitation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def inivitation_params
      params.expect(inivitation: [ :account_id, :token, :message, :receiver, :sender_id ])
    end
end
