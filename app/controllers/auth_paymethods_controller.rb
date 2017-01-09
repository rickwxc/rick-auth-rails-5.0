class AuthPaymethodsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_paymethod, only: [:show, :edit, :update, :destroy]

  # GET /auth_paymethods
  # GET /auth_paymethods.json
  def index
    @auth_paymethods = AuthPaymethod.all
  end

  # GET /auth_paymethods/1
  # GET /auth_paymethods/1.json
  def show
  end

  # GET /auth_paymethods/new
  def new
    @auth_paymethod = AuthPaymethod.new
  end

  # GET /auth_paymethods/1/edit
  def edit
  end

  # POST /auth_paymethods
  # POST /auth_paymethods.json
  def create
    @auth_paymethod = AuthPaymethod.new(auth_paymethod_params)

    respond_to do |format|
      if @auth_paymethod.save
        format.html { redirect_to @auth_paymethod, notice: 'Auth paymethod was successfully created.' }
        format.json { render :show, status: :created, location: @auth_paymethod }
      else
        format.html { render :new }
        format.json { render json: @auth_paymethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_paymethods/1
  # PATCH/PUT /auth_paymethods/1.json
  def update
    respond_to do |format|
      if @auth_paymethod.update(auth_paymethod_params)
        format.html { redirect_to @auth_paymethod, notice: 'Auth paymethod was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_paymethod }
      else
        format.html { render :edit }
        format.json { render json: @auth_paymethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_paymethods/1
  # DELETE /auth_paymethods/1.json
  def destroy
    @auth_paymethod.destroy
    respond_to do |format|
      format.html { redirect_to auth_paymethods_url, notice: 'Auth paymethod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_paymethod
      @auth_paymethod = AuthPaymethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_paymethod_params
      params.require(:auth_paymethod).permit(:auth_name)
    end
end
