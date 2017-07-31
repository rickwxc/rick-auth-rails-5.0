class AuthObjAttrsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_obj_attr, only: [:show, :edit, :update, :destroy]

  # GET /auth_obj_attrs
  # GET /auth_obj_attrs.json
  def index
    @auth_obj_attrs = AuthObjAttr.all
  end

  # GET /auth_obj_attrs/1
  # GET /auth_obj_attrs/1.json
  def show
  end

  # GET /auth_obj_attrs/new
  def new
    @auth_obj_attr = AuthObjAttr.new
  end

  # GET /auth_obj_attrs/1/edit
  def edit
  end

  # POST /auth_obj_attrs
  # POST /auth_obj_attrs.json
  def create
    @auth_obj_attr = AuthObjAttr.new(auth_obj_attr_params)

    respond_to do |format|
      if @auth_obj_attr.save
        format.html { redirect_to @auth_obj_attr, notice: 'Auth obj attr was successfully created.' }
        format.json { render :show, status: :created, location: @auth_obj_attr }
      else
        format.html { render :new }
        format.json { render json: @auth_obj_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_obj_attrs/1
  # PATCH/PUT /auth_obj_attrs/1.json
  def update
    respond_to do |format|
      if @auth_obj_attr.update(auth_obj_attr_params)
        format.html { redirect_to @auth_obj_attr, notice: 'Auth obj attr was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_obj_attr }
      else
        format.html { render :edit }
        format.json { render json: @auth_obj_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_obj_attrs/1
  # DELETE /auth_obj_attrs/1.json
  def destroy
    @auth_obj_attr.destroy
    respond_to do |format|
      format.html { redirect_to auth_obj_attrs_url, notice: 'Auth obj attr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_obj_attr
      @auth_obj_attr = AuthObjAttr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_obj_attr_params
      params.require(:auth_obj_attr).permit(:model, :obj_id, :auth_attr_type_id, :value, :idx)
    end
end
