class AuthOrderShippingRulesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_order_shipping_rule, only: [:show, :edit, :update, :destroy]

  # GET /auth_order_shipping_rules
  # GET /auth_order_shipping_rules.json
  def index
    @auth_order_shipping_rules = AuthOrderShippingRule.all
  end

  # GET /auth_order_shipping_rules/1
  # GET /auth_order_shipping_rules/1.json
  def show
  end

  # GET /auth_order_shipping_rules/new
  def new
    @auth_order_shipping_rule = AuthOrderShippingRule.new
  end

  # GET /auth_order_shipping_rules/1/edit
  def edit
  end

  # POST /auth_order_shipping_rules
  # POST /auth_order_shipping_rules.json
  def create
    @auth_order_shipping_rule = AuthOrderShippingRule.new(auth_order_shipping_rule_params)

    respond_to do |format|
      if @auth_order_shipping_rule.save
        format.html { redirect_to @auth_order_shipping_rule, notice: 'Auth order shipping rule was successfully created.' }
        format.json { render :show, status: :created, location: @auth_order_shipping_rule }
      else
        format.html { render :new }
        format.json { render json: @auth_order_shipping_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_order_shipping_rules/1
  # PATCH/PUT /auth_order_shipping_rules/1.json
  def update
    respond_to do |format|
      if @auth_order_shipping_rule.update(auth_order_shipping_rule_params)
        format.html { redirect_to @auth_order_shipping_rule, notice: 'Auth order shipping rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_order_shipping_rule }
      else
        format.html { render :edit }
        format.json { render json: @auth_order_shipping_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_order_shipping_rules/1
  # DELETE /auth_order_shipping_rules/1.json
  def destroy
    @auth_order_shipping_rule.destroy
    respond_to do |format|
      format.html { redirect_to auth_order_shipping_rules_url, notice: 'Auth order shipping rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_order_shipping_rule
      @auth_order_shipping_rule = AuthOrderShippingRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_order_shipping_rule_params
      params.require(:auth_order_shipping_rule).permit(:name, :cost, :order_amt, :is_enabled, :code)
    end
end
