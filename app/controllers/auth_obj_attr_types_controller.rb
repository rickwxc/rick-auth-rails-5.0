class AuthObjAttrTypesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_obj_attr_type, only: [:show, :edit, :update, :destroy]

  # GET /auth_obj_attr_types
  # GET /auth_obj_attr_types.json
  def index
    @auth_obj_attr_types = AuthObjAttrType.all
  end

  # GET /auth_obj_attr_types/1
  # GET /auth_obj_attr_types/1.json
  def show
  end

  # GET /auth_obj_attr_types/new
  def new
    @auth_obj_attr_type = AuthObjAttrType.new
  end

  # GET /auth_obj_attr_types/1/edit
  def edit
  end

  # POST /auth_obj_attr_types
  # POST /auth_obj_attr_types.json
  def create
    @auth_obj_attr_type = AuthObjAttrType.new(auth_obj_attr_type_params)

    respond_to do |format|
      if @auth_obj_attr_type.save
        format.html { redirect_to @auth_obj_attr_type, notice: 'Auth obj attr type was successfully created.' }
        format.json { render :show, status: :created, location: @auth_obj_attr_type }
      else
        format.html { render :new }
        format.json { render json: @auth_obj_attr_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_obj_attr_types/1
  # PATCH/PUT /auth_obj_attr_types/1.json
  def update
    respond_to do |format|
      if @auth_obj_attr_type.update(auth_obj_attr_type_params)
        format.html { redirect_to @auth_obj_attr_type, notice: 'Auth obj attr type was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_obj_attr_type }
      else
        format.html { render :edit }
        format.json { render json: @auth_obj_attr_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_obj_attr_types/1
  # DELETE /auth_obj_attr_types/1.json
  def destroy
    @auth_obj_attr_type.destroy
    respond_to do |format|
      format.html { redirect_to auth_obj_attr_types_url, notice: 'Auth obj attr type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_obj_attr_type
      @auth_obj_attr_type = AuthObjAttrType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_obj_attr_type_params
      params.require(:auth_obj_attr_type).permit(:name, :auth_obj_attr_group_id, :idx, :display_name)
    end
end
