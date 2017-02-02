class AuthAddrsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_addr, only: [:show, :edit, :update, :destroy]

  # GET /auth_addrs
  # GET /auth_addrs.json
  def index
    @auth_addrs = AuthAddr.all
  end

  # GET /auth_addrs/1
  # GET /auth_addrs/1.json
  def show
  end

  # GET /auth_addrs/new
  def new
    @auth_addr = AuthAddr.new
  end

  # GET /auth_addrs/1/edit
  def edit
  end

  # POST /auth_addrs
  # POST /auth_addrs.json
  def create
    @auth_addr = AuthAddr.new(auth_addr_params)

    respond_to do |format|
      if @auth_addr.save
        format.html { redirect_to @auth_addr, notice: 'Auth addr was successfully created.' }
        format.json { render :show, status: :created, location: @auth_addr }
      else
        format.html { render :new }
        format.json { render json: @auth_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_addrs/1
  # PATCH/PUT /auth_addrs/1.json
  def update
    respond_to do |format|
      if @auth_addr.update(auth_addr_params)
        format.html { redirect_to @auth_addr, notice: 'Auth addr was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_addr }
      else
        format.html { render :edit }
        format.json { render json: @auth_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_addrs/1
  # DELETE /auth_addrs/1.json
  def destroy
    @auth_addr.destroy
    respond_to do |format|
      format.html { redirect_to auth_addrs_url, notice: 'Auth addr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_addr
      @auth_addr = AuthAddr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_addr_params
      params.require(:auth_addr).permit(:street_number, :street, :auth_sb_id, :org, :raw_json)
    end
end
