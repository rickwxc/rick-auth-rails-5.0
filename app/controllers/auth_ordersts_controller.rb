class AuthOrderstsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_orderst, only: [:show, :edit, :update, :destroy]

  # GET /auth_ordersts
  # GET /auth_ordersts.json
  def index
    @auth_ordersts = AuthOrderst.all
  end

  # GET /auth_ordersts/1
  # GET /auth_ordersts/1.json
  def show
  end

  # GET /auth_ordersts/new
  def new
    @auth_orderst = AuthOrderst.new
  end

  # GET /auth_ordersts/1/edit
  def edit
  end

  # POST /auth_ordersts
  # POST /auth_ordersts.json
  def create
    @auth_orderst = AuthOrderst.new(auth_orderst_params)

    respond_to do |format|
      if @auth_orderst.save
        format.html { redirect_to @auth_orderst, notice: 'Auth orderst was successfully created.' }
        format.json { render :show, status: :created, location: @auth_orderst }
      else
        format.html { render :new }
        format.json { render json: @auth_orderst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_ordersts/1
  # PATCH/PUT /auth_ordersts/1.json
  def update
    respond_to do |format|
      if @auth_orderst.update(auth_orderst_params)
        format.html { redirect_to @auth_orderst, notice: 'Auth orderst was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_orderst }
      else
        format.html { render :edit }
        format.json { render json: @auth_orderst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_ordersts/1
  # DELETE /auth_ordersts/1.json
  def destroy
    @auth_orderst.destroy
    respond_to do |format|
      format.html { redirect_to auth_ordersts_url, notice: 'Auth orderst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_orderst
      @auth_orderst = AuthOrderst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_orderst_params
      params.require(:auth_orderst).permit(:auth_st, :auth_descr, :user_todo)
    end
end
