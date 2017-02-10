class AuthOrdersController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_order, only: [:show, :edit, :update, :destroy]

  # GET /auth_orders
  # GET /auth_orders.json
  def index
	  #@auth_orders = AuthOrder.all

	  @orderst_id = params[:orderst_id].to_i
	  if @orderst_id == 0
		  @orderst_id = AuthOrderst::Pending
	  end

	  @auth_orders = AuthOrder.where('auth_orderst_id' => @orderst_id).order('id desc').paginate(:page => params[:page], :per_page => 10)
  end

  # GET /auth_orders/1
  # GET /auth_orders/1.json
  def show
  end

  # GET /auth_orders/new
  def new
    @auth_order = AuthOrder.new
  end

  # GET /auth_orders/1/edit
  def edit
  end

  # POST /auth_orders
  # POST /auth_orders.json
  def create
    @auth_order = AuthOrder.new(auth_order_params)

    respond_to do |format|
      if @auth_order.save
        format.html { redirect_to @auth_order, notice: 'Auth order was successfully created.' }
        format.json { render :show, status: :created, location: @auth_order }
      else
        format.html { render :new }
        format.json { render json: @auth_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_orders/1
  # PATCH/PUT /auth_orders/1.json
  def update
    respond_to do |format|
      if @auth_order.update(auth_order_params)
        format.html { redirect_to @auth_order, notice: 'Auth order was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_order }
      else
        format.html { render :edit }
        format.json { render json: @auth_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_orders/1
  # DELETE /auth_orders/1.json
  def destroy
    @auth_order.destroy
    respond_to do |format|
      format.html { redirect_to auth_orders_url, notice: 'Auth order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_order
      @auth_order = AuthOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_order_params
      params.require(:auth_order).permit(:auth_user_id, :auth_visitor_uuid, :auth_total, :auth_gst, :auth_orderst_id, :auth_payst_id, :auth_note, :billing_addr_id, :shipping_addr_id)
    end
end
