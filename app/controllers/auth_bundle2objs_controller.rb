class AuthBundle2objsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_bundle2obj, only: [:show, :edit, :update, :destroy]

  # GET /auth_bundle2objs
  # GET /auth_bundle2objs.json
  def index
    @auth_bundle2objs = AuthBundle2obj.all
  end

  # GET /auth_bundle2objs/1
  # GET /auth_bundle2objs/1.json
  def show
  end

  # GET /auth_bundle2objs/new
  def new
    @auth_bundle2obj = AuthBundle2obj.new
  end

  # GET /auth_bundle2objs/1/edit
  def edit
  end

  # POST /auth_bundle2objs
  # POST /auth_bundle2objs.json
  def create
    @auth_bundle2obj = AuthBundle2obj.new(auth_bundle2obj_params)

    respond_to do |format|
      if @auth_bundle2obj.save
        format.html { redirect_to @auth_bundle2obj, notice: 'Auth bundle2obj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_bundle2obj }
      else
        format.html { render :new }
        format.json { render json: @auth_bundle2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_bundle2objs/1
  # PATCH/PUT /auth_bundle2objs/1.json
  def update
    respond_to do |format|
      if @auth_bundle2obj.update(auth_bundle2obj_params)
        format.html { redirect_to @auth_bundle2obj, notice: 'Auth bundle2obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_bundle2obj }
      else
        format.html { render :edit }
        format.json { render json: @auth_bundle2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_bundle2objs/1
  # DELETE /auth_bundle2objs/1.json
  def destroy
    @auth_bundle2obj.destroy
    respond_to do |format|
      format.html { redirect_to auth_bundle2objs_url, notice: 'Auth bundle2obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_bundle2obj
      @auth_bundle2obj = AuthBundle2obj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_bundle2obj_params
      params.require(:auth_bundle2obj).permit(:auth_bundle_id, :auth_obj_id, :auth_obj_model_name)
    end
end
