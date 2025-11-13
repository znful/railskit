class AccountsController < ApplicationController
  before_action :set_account, only: %i[ edit ]
  before_action :set_accounts_breadcrumb, except: %i[ index edit ]

  # GET /accounts or /accounts.json
  def index
    add_breadcrumb "Accounts"
    @accounts = Current.user.accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @account = Account.find_by(slug: params.expect(:slug))
    add_breadcrumb @account.name
    render layout: "settings"
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    add_breadcrumb @account.name
    render layout: "settings"
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @account = Account.find_by(slug: params.expect(:slug))
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Account was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account = Account.find_by(slug: params.expect(:slug))
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_path, notice: "Account was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find_by(slug: params.expect(:account_slug))
    end

    def set_accounts_breadcrumb
      add_breadcrumb "Accounts", accounts_path
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.expect(account: [ :name, :slug, :owner_id ])
    end
end
