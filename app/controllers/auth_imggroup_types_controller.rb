class AuthImggroupTypesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_imggroup_type, only: [:show, :edit, :update, :destroy]

  # GET /auth_imggroup_types
  # GET /auth_imggroup_types.json
  def index
    @auth_imggroup_types = AuthImggroupType.all
  end

  # GET /auth_imggroup_types/1
  # GET /auth_imggroup_types/1.json
  def show
  end

  # GET /auth_imggroup_types/new
  def new
    @auth_imggroup_type = AuthImggroupType.new
  end

  # GET /auth_imggroup_types/1/edit
  def edit
  end

  # POST /auth_imggroup_types
  # POST /auth_imggroup_types.json
  def create
    @auth_imggroup_type = AuthImggroupType.new(auth_imggroup_type_params)

    respond_to do |format|
      if @auth_imggroup_type.save
        format.html { redirect_to @auth_imggroup_type, notice: 'Auth imggroup type was successfully created.' }
        format.json { render :show, status: :created, location: @auth_imggroup_type }
      else
        format.html { render :new }
        format.json { render json: @auth_imggroup_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_imggroup_types/1
  # PATCH/PUT /auth_imggroup_types/1.json
  def update
    respond_to do |format|
      if @auth_imggroup_type.update(auth_imggroup_type_params)
        format.html { redirect_to @auth_imggroup_type, notice: 'Auth imggroup type was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_imggroup_type }
      else
        format.html { render :edit }
        format.json { render json: @auth_imggroup_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_imggroup_types/1
  # DELETE /auth_imggroup_types/1.json
  def destroy
    @auth_imggroup_type.destroy
    respond_to do |format|
      format.html { redirect_to auth_imggroup_types_url, notice: 'Auth imggroup type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_imggroup_type
      @auth_imggroup_type = AuthImggroupType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_imggroup_type_params
      params.require(:auth_imggroup_type).permit(:name, :acckey)
    end
end
