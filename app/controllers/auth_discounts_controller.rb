class AuthDiscountsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_discount, only: [:show, :edit, :update, :destroy]

  # GET /auth_discounts
  # GET /auth_discounts.json
  def index
	  @auth_discounts = AuthDiscount.order('id desc').all
  end

  # GET /auth_discounts/1
  # GET /auth_discounts/1.json
  def show
  end

  # GET /auth_discounts/new
  def new
    @auth_discount = AuthDiscount.new

	if params[:model] && params[:obj_id]
		@auth_discount.model ||= params[:model] 
		@auth_discount.obj_id ||= params[:obj_id]
	else
		redirect_to auth_discounts_path
	end

  end

  # GET /auth_discounts/1/edit
  def edit
  end

  # POST /auth_discounts
  # POST /auth_discounts.json
  def create
    @auth_discount = AuthDiscount.new(auth_discount_params)

    respond_to do |format|
      if @auth_discount.save
        format.html { redirect_to @auth_discount, notice: 'Auth discount was successfully created.' }
        format.json { render :show, status: :created, location: @auth_discount }
      else
        format.html { render :new }
        format.json { render json: @auth_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_discounts/1
  # PATCH/PUT /auth_discounts/1.json
  def update
    respond_to do |format|
      if @auth_discount.update(auth_discount_params)
        format.html { redirect_to @auth_discount, notice: 'Auth discount was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_discount }
      else
        format.html { render :edit }
        format.json { render json: @auth_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_discounts/1
  # DELETE /auth_discounts/1.json
  def destroy
    @auth_discount.destroy
    respond_to do |format|
      format.html { redirect_to auth_discounts_url, notice: 'Auth discount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_discount
      @auth_discount = AuthDiscount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_discount_params
      params.require(:auth_discount).permit(:model, :obj_id, :amt)
    end
end
