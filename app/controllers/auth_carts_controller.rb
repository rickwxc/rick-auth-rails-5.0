class AuthCartsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_cart, only: [:show, :edit, :update, :destroy]

  # GET /auth_carts
  # GET /auth_carts.json
  def index
    @auth_carts = AuthCart.all
  end

  # GET /auth_carts/1
  # GET /auth_carts/1.json
  def show
  end

  # GET /auth_carts/new
  def new
    @auth_cart = AuthCart.new
  end

  # GET /auth_carts/1/edit
  def edit
  end

  # POST /auth_carts
  # POST /auth_carts.json
  def create
    @auth_cart = AuthCart.new(auth_cart_params)

    respond_to do |format|
      if @auth_cart.save
        format.html { redirect_to @auth_cart, notice: 'Auth cart was successfully created.' }
        format.json { render :show, status: :created, location: @auth_cart }
      else
        format.html { render :new }
        format.json { render json: @auth_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_carts/1
  # PATCH/PUT /auth_carts/1.json
  def update
    respond_to do |format|
      if @auth_cart.update(auth_cart_params)
        format.html { redirect_to @auth_cart, notice: 'Auth cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_cart }
      else
        format.html { render :edit }
        format.json { render json: @auth_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_carts/1
  # DELETE /auth_carts/1.json
  def destroy
    @auth_cart.destroy
    respond_to do |format|
      format.html { redirect_to auth_carts_url, notice: 'Auth cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_cart
      @auth_cart = AuthCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_cart_params
      params.require(:auth_cart).permit(:auth_user_id, :auth_visitor_uuid, :auth_obj_id, :auth_obj_model_name, :auth_obj_qty, :auth_obj_meta_json)
    end
end
