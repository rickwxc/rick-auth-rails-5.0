class AuthOrder2objsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_order2obj, only: [:show, :edit, :update, :destroy]

  # GET /auth_order2objs
  # GET /auth_order2objs.json
  def index
	  @auth_order2objs = AuthOrder2obj.order('id desc').first(20)
  end

  # GET /auth_order2objs/1
  # GET /auth_order2objs/1.json
  def show
  end

  # GET /auth_order2objs/new
  def new
    @auth_order2obj = AuthOrder2obj.new
  end

  # GET /auth_order2objs/1/edit
  def edit
  end

  # POST /auth_order2objs
  # POST /auth_order2objs.json
  def create
    @auth_order2obj = AuthOrder2obj.new(auth_order2obj_params)

    respond_to do |format|
      if @auth_order2obj.save
        format.html { redirect_to @auth_order2obj, notice: 'Auth order2obj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_order2obj }
      else
        format.html { render :new }
        format.json { render json: @auth_order2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_order2objs/1
  # PATCH/PUT /auth_order2objs/1.json
  def update
    respond_to do |format|
      if @auth_order2obj.update(auth_order2obj_params)
        format.html { redirect_to @auth_order2obj, notice: 'Auth order2obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_order2obj }
      else
        format.html { render :edit }
        format.json { render json: @auth_order2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_order2objs/1
  # DELETE /auth_order2objs/1.json
  def destroy
    @auth_order2obj.destroy
    respond_to do |format|
      format.html { redirect_to auth_order2objs_url, notice: 'Auth order2obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_order2obj
      @auth_order2obj = AuthOrder2obj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_order2obj_params
      params.require(:auth_order2obj).permit(:auth_order_id, :auth_total, :auth_gst, :auth_obj_id, :auth_obj_model_name, :auth_obj_display_name, :auth_obj_qty, :auth_obj_unitprice)
    end
end
