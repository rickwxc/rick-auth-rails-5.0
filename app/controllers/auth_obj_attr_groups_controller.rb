class AuthObjAttrGroupsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_obj_attr_group, only: [:show, :edit, :update, :destroy]

  # GET /auth_obj_attr_groups
  # GET /auth_obj_attr_groups.json
  def index
    @auth_obj_attr_groups = AuthObjAttrGroup.all
  end

  # GET /auth_obj_attr_groups/1
  # GET /auth_obj_attr_groups/1.json
  def show
  end

  # GET /auth_obj_attr_groups/new
  def new
    @auth_obj_attr_group = AuthObjAttrGroup.new
  end

  # GET /auth_obj_attr_groups/1/edit
  def edit
  end

  # POST /auth_obj_attr_groups
  # POST /auth_obj_attr_groups.json
  def create
    @auth_obj_attr_group = AuthObjAttrGroup.new(auth_obj_attr_group_params)

    respond_to do |format|
      if @auth_obj_attr_group.save
        format.html { redirect_to @auth_obj_attr_group, notice: 'Auth obj attr group was successfully created.' }
        format.json { render :show, status: :created, location: @auth_obj_attr_group }
      else
        format.html { render :new }
        format.json { render json: @auth_obj_attr_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_obj_attr_groups/1
  # PATCH/PUT /auth_obj_attr_groups/1.json
  def update
    respond_to do |format|
      if @auth_obj_attr_group.update(auth_obj_attr_group_params)
        format.html { redirect_to @auth_obj_attr_group, notice: 'Auth obj attr group was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_obj_attr_group }
      else
        format.html { render :edit }
        format.json { render json: @auth_obj_attr_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_obj_attr_groups/1
  # DELETE /auth_obj_attr_groups/1.json
  def destroy
    @auth_obj_attr_group.destroy
    respond_to do |format|
      format.html { redirect_to auth_obj_attr_groups_url, notice: 'Auth obj attr group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_obj_attr_group
      @auth_obj_attr_group = AuthObjAttrGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_obj_attr_group_params
      params.require(:auth_obj_attr_group).permit(:name)
    end
end
