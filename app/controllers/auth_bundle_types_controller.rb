class AuthBundleTypesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_bundle_type, only: [:show, :edit, :update, :destroy]

  # GET /auth_bundle_types
  # GET /auth_bundle_types.json
  def index
    @auth_bundle_types = AuthBundleType.all
  end

  # GET /auth_bundle_types/1
  # GET /auth_bundle_types/1.json
  def show
  end

  # GET /auth_bundle_types/new
  def new
    @auth_bundle_type = AuthBundleType.new
  end

  # GET /auth_bundle_types/1/edit
  def edit
  end

  # POST /auth_bundle_types
  # POST /auth_bundle_types.json
  def create
    @auth_bundle_type = AuthBundleType.new(auth_bundle_type_params)

    respond_to do |format|
      if @auth_bundle_type.save
        format.html { redirect_to @auth_bundle_type, notice: 'Auth bundle type was successfully created.' }
        format.json { render :show, status: :created, location: @auth_bundle_type }
      else
        format.html { render :new }
        format.json { render json: @auth_bundle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_bundle_types/1
  # PATCH/PUT /auth_bundle_types/1.json
  def update
    respond_to do |format|
      if @auth_bundle_type.update(auth_bundle_type_params)
        format.html { redirect_to @auth_bundle_type, notice: 'Auth bundle type was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_bundle_type }
      else
        format.html { render :edit }
        format.json { render json: @auth_bundle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_bundle_types/1
  # DELETE /auth_bundle_types/1.json
  def destroy
    @auth_bundle_type.destroy
    respond_to do |format|
      format.html { redirect_to auth_bundle_types_url, notice: 'Auth bundle type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_bundle_type
      @auth_bundle_type = AuthBundleType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_bundle_type_params
      params.require(:auth_bundle_type).permit(:name)
    end
end
