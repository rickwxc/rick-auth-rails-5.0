class AuthInvoicesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_invoice, only: [:show, :edit, :update, :destroy]

  # GET /auth_invoices
  # GET /auth_invoices.json
  def index
    @auth_invoices = AuthInvoice.all
  end

  # GET /auth_invoices/1
  # GET /auth_invoices/1.json
  def show
  end

  # GET /auth_invoices/new
  def new
    @auth_invoice = AuthInvoice.new
  end

  # GET /auth_invoices/1/edit
  def edit
  end

  # POST /auth_invoices
  # POST /auth_invoices.json
  def create
    @auth_invoice = AuthInvoice.new(auth_invoice_params)

    respond_to do |format|
      if @auth_invoice.save
        format.html { redirect_to @auth_invoice, notice: 'Auth invoice was successfully created.' }
        format.json { render :show, status: :created, location: @auth_invoice }
      else
        format.html { render :new }
        format.json { render json: @auth_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_invoices/1
  # PATCH/PUT /auth_invoices/1.json
  def update
    respond_to do |format|
      if @auth_invoice.update(auth_invoice_params)
        format.html { redirect_to @auth_invoice, notice: 'Auth invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_invoice }
      else
        format.html { render :edit }
        format.json { render json: @auth_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_invoices/1
  # DELETE /auth_invoices/1.json
  def destroy
    @auth_invoice.destroy
    respond_to do |format|
      format.html { redirect_to auth_invoices_url, notice: 'Auth invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_invoice
      @auth_invoice = AuthInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_invoice_params
      params.require(:auth_invoice).permit(:uuid, :gross, :fee, :auth_order_id, :auth_paymethod_id, :auth_invoicest_id)
    end
end
