class AuthPaystsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_payst, only: [:show, :edit, :update, :destroy]

  # GET /auth_paysts
  # GET /auth_paysts.json
  def index
    @auth_paysts = AuthPayst.all
  end

  # GET /auth_paysts/1
  # GET /auth_paysts/1.json
  def show
  end

  # GET /auth_paysts/new
  def new
    @auth_payst = AuthPayst.new
  end

  # GET /auth_paysts/1/edit
  def edit
  end

  # POST /auth_paysts
  # POST /auth_paysts.json
  def create
    @auth_payst = AuthPayst.new(auth_payst_params)

    respond_to do |format|
      if @auth_payst.save
        format.html { redirect_to @auth_payst, notice: 'Auth payst was successfully created.' }
        format.json { render :show, status: :created, location: @auth_payst }
      else
        format.html { render :new }
        format.json { render json: @auth_payst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_paysts/1
  # PATCH/PUT /auth_paysts/1.json
  def update
    respond_to do |format|
      if @auth_payst.update(auth_payst_params)
        format.html { redirect_to @auth_payst, notice: 'Auth payst was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_payst }
      else
        format.html { render :edit }
        format.json { render json: @auth_payst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_paysts/1
  # DELETE /auth_paysts/1.json
  def destroy
    @auth_payst.destroy
    respond_to do |format|
      format.html { redirect_to auth_paysts_url, notice: 'Auth payst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_payst
      @auth_payst = AuthPayst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_payst_params
      params.require(:auth_payst).permit(:auth_st)
    end
end
