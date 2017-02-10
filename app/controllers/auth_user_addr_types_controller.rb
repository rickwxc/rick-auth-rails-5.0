class AuthUserAddrTypesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_user_addr_type, only: [:show, :edit, :update, :destroy]

  # GET /auth_user_addr_types
  # GET /auth_user_addr_types.json
  def index
    @auth_user_addr_types = AuthUserAddrType.all
  end

  # GET /auth_user_addr_types/1
  # GET /auth_user_addr_types/1.json
  def show
  end

  # GET /auth_user_addr_types/new
  def new
    @auth_user_addr_type = AuthUserAddrType.new
  end

  # GET /auth_user_addr_types/1/edit
  def edit
  end

  # POST /auth_user_addr_types
  # POST /auth_user_addr_types.json
  def create
    @auth_user_addr_type = AuthUserAddrType.new(auth_user_addr_type_params)

    respond_to do |format|
      if @auth_user_addr_type.save
        format.html { redirect_to @auth_user_addr_type, notice: 'Auth user addr type was successfully created.' }
        format.json { render :show, status: :created, location: @auth_user_addr_type }
      else
        format.html { render :new }
        format.json { render json: @auth_user_addr_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_user_addr_types/1
  # PATCH/PUT /auth_user_addr_types/1.json
  def update
    respond_to do |format|
      if @auth_user_addr_type.update(auth_user_addr_type_params)
        format.html { redirect_to @auth_user_addr_type, notice: 'Auth user addr type was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_user_addr_type }
      else
        format.html { render :edit }
        format.json { render json: @auth_user_addr_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_user_addr_types/1
  # DELETE /auth_user_addr_types/1.json
  def destroy
    @auth_user_addr_type.destroy
    respond_to do |format|
      format.html { redirect_to auth_user_addr_types_url, notice: 'Auth user addr type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_user_addr_type
      @auth_user_addr_type = AuthUserAddrType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_user_addr_type_params
      params.require(:auth_user_addr_type).permit(:name)
    end
end
