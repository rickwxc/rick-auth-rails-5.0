class AuthUserAddrsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_user_addr, only: [:show, :edit, :update, :destroy]

  # GET /auth_user_addrs
  # GET /auth_user_addrs.json
  def index
    @auth_user_addrs = AuthUserAddr.all
  end

  # GET /auth_user_addrs/1
  # GET /auth_user_addrs/1.json
  def show
  end

  # GET /auth_user_addrs/new
  def new
    @auth_user_addr = AuthUserAddr.new
  end

  # GET /auth_user_addrs/1/edit
  def edit
  end

  # POST /auth_user_addrs
  # POST /auth_user_addrs.json
  def create
    @auth_user_addr = AuthUserAddr.new(auth_user_addr_params)

    respond_to do |format|
      if @auth_user_addr.save
        format.html { redirect_to @auth_user_addr, notice: 'Auth user addr was successfully created.' }
        format.json { render :show, status: :created, location: @auth_user_addr }
      else
        format.html { render :new }
        format.json { render json: @auth_user_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_user_addrs/1
  # PATCH/PUT /auth_user_addrs/1.json
  def update
    respond_to do |format|
      if @auth_user_addr.update(auth_user_addr_params)
        format.html { redirect_to @auth_user_addr, notice: 'Auth user addr was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_user_addr }
      else
        format.html { render :edit }
        format.json { render json: @auth_user_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_user_addrs/1
  # DELETE /auth_user_addrs/1.json
  def destroy
    @auth_user_addr.destroy
    respond_to do |format|
      format.html { redirect_to auth_user_addrs_url, notice: 'Auth user addr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_user_addr
      @auth_user_addr = AuthUserAddr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_user_addr_params
      params.require(:auth_user_addr).permit(:auth_user_id, :auth_visitor_uuid, :auth_user_addr_type_id, :auth_addr_id, :firstname, :lastname, :mobile, :company)
    end
end
