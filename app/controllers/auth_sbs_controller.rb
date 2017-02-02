class AuthSbsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_sb, only: [:show, :edit, :update, :destroy]

  # GET /auth_sbs
  # GET /auth_sbs.json
  def index
    @auth_sbs = AuthSb.all
  end

  # GET /auth_sbs/1
  # GET /auth_sbs/1.json
  def show
  end

  # GET /auth_sbs/new
  def new
    @auth_sb = AuthSb.new
  end

  # GET /auth_sbs/1/edit
  def edit
  end

  # POST /auth_sbs
  # POST /auth_sbs.json
  def create
    @auth_sb = AuthSb.new(auth_sb_params)

    respond_to do |format|
      if @auth_sb.save
        format.html { redirect_to @auth_sb, notice: 'Auth sb was successfully created.' }
        format.json { render :show, status: :created, location: @auth_sb }
      else
        format.html { render :new }
        format.json { render json: @auth_sb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_sbs/1
  # PATCH/PUT /auth_sbs/1.json
  def update
    respond_to do |format|
      if @auth_sb.update(auth_sb_params)
        format.html { redirect_to @auth_sb, notice: 'Auth sb was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_sb }
      else
        format.html { render :edit }
        format.json { render json: @auth_sb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_sbs/1
  # DELETE /auth_sbs/1.json
  def destroy
    @auth_sb.destroy
    respond_to do |format|
      format.html { redirect_to auth_sbs_url, notice: 'Auth sb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_sb
      @auth_sb = AuthSb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_sb_params
      params.require(:auth_sb).permit(:name, :zip, :auth_st_id)
    end
end
