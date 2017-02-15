class AuthCouponsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_coupon, only: [:show, :edit, :update, :destroy]

  # GET /auth_coupons
  # GET /auth_coupons.json
  def index
    @auth_coupons = AuthCoupon.all
  end

  # GET /auth_coupons/1
  # GET /auth_coupons/1.json
  def show
  end

  # GET /auth_coupons/new
  def new
    @auth_coupon = AuthCoupon.new
  end

  # GET /auth_coupons/1/edit
  def edit
  end

  # POST /auth_coupons
  # POST /auth_coupons.json
  def create
    @auth_coupon = AuthCoupon.new(auth_coupon_params)

    respond_to do |format|
      if @auth_coupon.save
        format.html { redirect_to @auth_coupon, notice: 'Auth coupon was successfully created.' }
        format.json { render :show, status: :created, location: @auth_coupon }
      else
        format.html { render :new }
        format.json { render json: @auth_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_coupons/1
  # PATCH/PUT /auth_coupons/1.json
  def update
    respond_to do |format|
      if @auth_coupon.update(auth_coupon_params)
        format.html { redirect_to @auth_coupon, notice: 'Auth coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_coupon }
      else
        format.html { render :edit }
        format.json { render json: @auth_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_coupons/1
  # DELETE /auth_coupons/1.json
  def destroy
    @auth_coupon.destroy
    respond_to do |format|
      format.html { redirect_to auth_coupons_url, notice: 'Auth coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_coupon
      @auth_coupon = AuthCoupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_coupon_params
      params.require(:auth_coupon).permit(:code, :name, :val, :expire_at, :is_enabled)
    end
end
