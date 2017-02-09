class AuthObjsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_obj, only: [:show, :edit, :update, :destroy]

  # GET /auth_objs
  # GET /auth_objs.json
  def index
    @auth_objs = AuthObj.all
  end

  # GET /auth_objs/1
  # GET /auth_objs/1.json
  def show
  end

  # GET /auth_objs/new
  def new
    @auth_obj = AuthObj.new
  end

  # GET /auth_objs/1/edit
  def edit
  end

  # POST /auth_objs
  # POST /auth_objs.json
  def create
    @auth_obj = AuthObj.new(auth_obj_params)

    respond_to do |format|
      if @auth_obj.save
        format.html { redirect_to @auth_obj, notice: 'Auth obj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_obj }
      else
        format.html { render :new }
        format.json { render json: @auth_obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_objs/1
  # PATCH/PUT /auth_objs/1.json
  def update
    respond_to do |format|
      if @auth_obj.update(auth_obj_params)
        format.html { redirect_to @auth_obj, notice: 'Auth obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_obj }
      else
        format.html { render :edit }
        format.json { render json: @auth_obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_objs/1
  # DELETE /auth_objs/1.json
  def destroy
    @auth_obj.destroy
    respond_to do |format|
      format.html { redirect_to auth_objs_url, notice: 'Auth obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_obj
      @auth_obj = AuthObj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_obj_params
      params.require(:auth_obj).permit(:auth_name, :auth_uuid, :auth_is_disabled, :auth_descr, :auth_unitprice)
    end
end
