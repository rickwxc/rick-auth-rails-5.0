class AuthImggroupsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_imggroup, only: [:show, :edit, :update, :destroy]

  # GET /auth_imggroups
  # GET /auth_imggroups.json
  def index
    @auth_imggroups = AuthImggroup.all
  end

  # GET /auth_imggroups/1
  # GET /auth_imggroups/1.json
  def show
  end

  # GET /auth_imggroups/new
  def new
    @auth_imggroup = AuthImggroup.new
	if params[:model] && params[:obj_id] && params[:name]
		@auth_imggroup.model ||= params[:model] 
		@auth_imggroup.obj_id ||= params[:obj_id]
		@auth_imggroup.name ||= params[:name]
	else
		redirect_to auth_imggroups_path
	end
  end

  # GET /auth_imggroups/1/edit
  def edit
  end

  # POST /auth_imggroups
  # POST /auth_imggroups.json
  def create
    @auth_imggroup = AuthImggroup.new(auth_imggroup_params)

    respond_to do |format|
      if @auth_imggroup.save
        format.html { redirect_to @auth_imggroup, notice: 'Auth imggroup was successfully created.' }
        format.json { render :show, status: :created, location: @auth_imggroup }
      else
        format.html { render :new }
        format.json { render json: @auth_imggroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_imggroups/1
  # PATCH/PUT /auth_imggroups/1.json
  def update
    respond_to do |format|
      if @auth_imggroup.update(auth_imggroup_params)
        format.html { redirect_to @auth_imggroup, notice: 'Auth imggroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_imggroup }
      else
        format.html { render :edit }
        format.json { render json: @auth_imggroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_imggroups/1
  # DELETE /auth_imggroups/1.json
  def destroy
    @auth_imggroup.destroy
    respond_to do |format|
      format.html { redirect_to auth_imggroups_url, notice: 'Auth imggroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_imggroup
      @auth_imggroup = AuthImggroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_imggroup_params
      params.require(:auth_imggroup).permit(:name, :auth_imggroup_type_id, :maximg, :obj_id, :model)
    end
end
