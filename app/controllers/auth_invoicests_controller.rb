class AuthInvoicestsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_invoicest, only: [:show, :edit, :update, :destroy]

  # GET /auth_invoicests
  # GET /auth_invoicests.json
  def index
    @auth_invoicests = AuthInvoicest.all
  end

  # GET /auth_invoicests/1
  # GET /auth_invoicests/1.json
  def show
  end

  # GET /auth_invoicests/new
  def new
    @auth_invoicest = AuthInvoicest.new
  end

  # GET /auth_invoicests/1/edit
  def edit
  end

  # POST /auth_invoicests
  # POST /auth_invoicests.json
  def create
    @auth_invoicest = AuthInvoicest.new(auth_invoicest_params)

    respond_to do |format|
      if @auth_invoicest.save
        format.html { redirect_to @auth_invoicest, notice: 'Auth invoicest was successfully created.' }
        format.json { render :show, status: :created, location: @auth_invoicest }
      else
        format.html { render :new }
        format.json { render json: @auth_invoicest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_invoicests/1
  # PATCH/PUT /auth_invoicests/1.json
  def update
    respond_to do |format|
      if @auth_invoicest.update(auth_invoicest_params)
        format.html { redirect_to @auth_invoicest, notice: 'Auth invoicest was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_invoicest }
      else
        format.html { render :edit }
        format.json { render json: @auth_invoicest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_invoicests/1
  # DELETE /auth_invoicests/1.json
  def destroy
    @auth_invoicest.destroy
    respond_to do |format|
      format.html { redirect_to auth_invoicests_url, notice: 'Auth invoicest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_invoicest
      @auth_invoicest = AuthInvoicest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_invoicest_params
      params.require(:auth_invoicest).permit(:auth_st)
    end
end
