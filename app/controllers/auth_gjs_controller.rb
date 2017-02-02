class AuthGjsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_gj, only: [:show, :edit, :update, :destroy]

  # GET /auth_gjs
  # GET /auth_gjs.json
  def index
    @auth_gjs = AuthGj.all
  end

  # GET /auth_gjs/1
  # GET /auth_gjs/1.json
  def show
  end

  # GET /auth_gjs/new
  def new
    @auth_gj = AuthGj.new
  end

  # GET /auth_gjs/1/edit
  def edit
  end

  # POST /auth_gjs
  # POST /auth_gjs.json
  def create
    @auth_gj = AuthGj.new(auth_gj_params)

    respond_to do |format|
      if @auth_gj.save
        format.html { redirect_to @auth_gj, notice: 'Auth gj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_gj }
      else
        format.html { render :new }
        format.json { render json: @auth_gj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_gjs/1
  # PATCH/PUT /auth_gjs/1.json
  def update
    respond_to do |format|
      if @auth_gj.update(auth_gj_params)
        format.html { redirect_to @auth_gj, notice: 'Auth gj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_gj }
      else
        format.html { render :edit }
        format.json { render json: @auth_gj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_gjs/1
  # DELETE /auth_gjs/1.json
  def destroy
    @auth_gj.destroy
    respond_to do |format|
      format.html { redirect_to auth_gjs_url, notice: 'Auth gj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_gj
      @auth_gj = AuthGj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_gj_params
      params.require(:auth_gj).permit(:name)
    end
end
