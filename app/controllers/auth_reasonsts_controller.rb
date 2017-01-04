class AuthReasonstsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_reasonst, only: [:show, :edit, :update, :destroy]

  # GET /auth_reasonsts
  # GET /auth_reasonsts.json
  def index
    @auth_reasonsts = AuthReasonst.all
  end

  # GET /auth_reasonsts/1
  # GET /auth_reasonsts/1.json
  def show
  end

  # GET /auth_reasonsts/new
  def new
    @auth_reasonst = AuthReasonst.new
  end

  # GET /auth_reasonsts/1/edit
  def edit
  end

  # POST /auth_reasonsts
  # POST /auth_reasonsts.json
  def create
    @auth_reasonst = AuthReasonst.new(auth_reasonst_params)

    respond_to do |format|
      if @auth_reasonst.save
        format.html { redirect_to @auth_reasonst, notice: 'Auth reasonst was successfully created.' }
        format.json { render :show, status: :created, location: @auth_reasonst }
      else
        format.html { render :new }
        format.json { render json: @auth_reasonst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_reasonsts/1
  # PATCH/PUT /auth_reasonsts/1.json
  def update
    respond_to do |format|
      if @auth_reasonst.update(auth_reasonst_params)
        format.html { redirect_to @auth_reasonst, notice: 'Auth reasonst was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_reasonst }
      else
        format.html { render :edit }
        format.json { render json: @auth_reasonst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_reasonsts/1
  # DELETE /auth_reasonsts/1.json
  def destroy
    @auth_reasonst.destroy
    respond_to do |format|
      format.html { redirect_to auth_reasonsts_url, notice: 'Auth reasonst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_reasonst
      @auth_reasonst = AuthReasonst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_reasonst_params
      params.require(:auth_reasonst).permit(:st)
    end
end
