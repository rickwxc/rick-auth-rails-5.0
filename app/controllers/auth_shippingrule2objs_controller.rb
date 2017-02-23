class AuthShippingrule2objsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_shippingrule2obj, only: [:show, :edit, :update, :destroy]

  # GET /auth_shippingrule2objs
  # GET /auth_shippingrule2objs.json
  def index
    @auth_shippingrule2objs = AuthShippingrule2obj.all
  end

  # GET /auth_shippingrule2objs/1
  # GET /auth_shippingrule2objs/1.json
  def show
  end

  # GET /auth_shippingrule2objs/new
  def new
    @auth_shippingrule2obj = AuthShippingrule2obj.new
	if params[:auth_sel_shippingrule_id]
		@auth_shippingrule2obj.auth_sel_shippingrule_id = params[:auth_sel_shippingrule_id]
	end
  end

  # GET /auth_shippingrule2objs/1/edit
  def edit
  end

  # POST /auth_shippingrule2objs
  # POST /auth_shippingrule2objs.json
  def create
    @auth_shippingrule2obj = AuthShippingrule2obj.new(auth_shippingrule2obj_params)

    respond_to do |format|
      if @auth_shippingrule2obj.save
        format.html { redirect_to @auth_shippingrule2obj, notice: 'Auth shippingrule2obj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_shippingrule2obj }
      else
        format.html { render :new }
        format.json { render json: @auth_shippingrule2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_shippingrule2objs/1
  # PATCH/PUT /auth_shippingrule2objs/1.json
  def update
    respond_to do |format|
      if @auth_shippingrule2obj.update(auth_shippingrule2obj_params)
        format.html { redirect_to @auth_shippingrule2obj, notice: 'Auth shippingrule2obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_shippingrule2obj }
      else
        format.html { render :edit }
        format.json { render json: @auth_shippingrule2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_shippingrule2objs/1
  # DELETE /auth_shippingrule2objs/1.json
  def destroy
    @auth_shippingrule2obj.destroy
    respond_to do |format|
      format.html { redirect_to auth_shippingrule2objs_url, notice: 'Auth shippingrule2obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_shippingrule2obj
      @auth_shippingrule2obj = AuthShippingrule2obj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_shippingrule2obj_params
      params.require(:auth_shippingrule2obj).permit(:model, :auth_sel_shippingrule_id)
    end
end
