class AuthBundlesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_bundle, only: [:show, :edit, :update, :destroy]

  # GET /auth_bundles
  # GET /auth_bundles.json
  def index
    @auth_bundles = AuthBundle.all
  end

  # GET /auth_bundles/1
  # GET /auth_bundles/1.json
  def show
  end

  # GET /auth_bundles/new
  def new
    @auth_bundle = AuthBundle.new
  end

  # GET /auth_bundles/1/edit
  def edit
  end

  # POST /auth_bundles
  # POST /auth_bundles.json
  def create
    @auth_bundle = AuthBundle.new(auth_bundle_params)

    respond_to do |format|
      if @auth_bundle.save
        format.html { redirect_to @auth_bundle, notice: 'Auth bundle was successfully created.' }
        format.json { render :show, status: :created, location: @auth_bundle }
      else
        format.html { render :new }
        format.json { render json: @auth_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_bundles/1
  # PATCH/PUT /auth_bundles/1.json
  def update
    respond_to do |format|
      if @auth_bundle.update(auth_bundle_params)
        format.html { redirect_to @auth_bundle, notice: 'Auth bundle was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_bundle }
      else
        format.html { render :edit }
        format.json { render json: @auth_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_bundles/1
  # DELETE /auth_bundles/1.json
  def destroy
    @auth_bundle.destroy
    respond_to do |format|
      format.html { redirect_to auth_bundles_url, notice: 'Auth bundle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_bundle
      @auth_bundle = AuthBundle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_bundle_params
      params.require(:auth_bundle).permit(:auth_name, :auth_total, :descr, :auth_bundle_type_id)
    end
end
