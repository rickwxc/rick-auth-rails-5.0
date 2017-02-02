class AuthStsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_st, only: [:show, :edit, :update, :destroy]

  # GET /auth_sts
  # GET /auth_sts.json
  def index
    @auth_sts = AuthSt.all
  end

  # GET /auth_sts/1
  # GET /auth_sts/1.json
  def show
  end

  # GET /auth_sts/new
  def new
    @auth_st = AuthSt.new
  end

  # GET /auth_sts/1/edit
  def edit
  end

  # POST /auth_sts
  # POST /auth_sts.json
  def create
    @auth_st = AuthSt.new(auth_st_params)

    respond_to do |format|
      if @auth_st.save
        format.html { redirect_to @auth_st, notice: 'Auth st was successfully created.' }
        format.json { render :show, status: :created, location: @auth_st }
      else
        format.html { render :new }
        format.json { render json: @auth_st.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_sts/1
  # PATCH/PUT /auth_sts/1.json
  def update
    respond_to do |format|
      if @auth_st.update(auth_st_params)
        format.html { redirect_to @auth_st, notice: 'Auth st was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_st }
      else
        format.html { render :edit }
        format.json { render json: @auth_st.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_sts/1
  # DELETE /auth_sts/1.json
  def destroy
    @auth_st.destroy
    respond_to do |format|
      format.html { redirect_to auth_sts_url, notice: 'Auth st was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_st
      @auth_st = AuthSt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_st_params
      params.require(:auth_st).permit(:name, :auth_gj_id)
    end
end
