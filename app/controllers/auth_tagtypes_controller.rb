class AuthTagtypesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_tagtype, only: [:show, :edit, :update, :destroy]

  # GET /auth_tagtypes
  # GET /auth_tagtypes.json
  def index
    @auth_tagtypes = AuthTagtype.all
  end

  # GET /auth_tagtypes/1
  # GET /auth_tagtypes/1.json
  def show
  end

  # GET /auth_tagtypes/new
  def new
    @auth_tagtype = AuthTagtype.new
  end

  # GET /auth_tagtypes/1/edit
  def edit
  end

  # POST /auth_tagtypes
  # POST /auth_tagtypes.json
  def create
    @auth_tagtype = AuthTagtype.new(auth_tagtype_params)

    respond_to do |format|
      if @auth_tagtype.save
        format.html { redirect_to @auth_tagtype, notice: 'Auth tagtype was successfully created.' }
        format.json { render :show, status: :created, location: @auth_tagtype }
      else
        format.html { render :new }
        format.json { render json: @auth_tagtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_tagtypes/1
  # PATCH/PUT /auth_tagtypes/1.json
  def update
    respond_to do |format|
      if @auth_tagtype.update(auth_tagtype_params)
        format.html { redirect_to @auth_tagtype, notice: 'Auth tagtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_tagtype }
      else
        format.html { render :edit }
        format.json { render json: @auth_tagtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_tagtypes/1
  # DELETE /auth_tagtypes/1.json
  def destroy
    @auth_tagtype.destroy
    respond_to do |format|
      format.html { redirect_to auth_tagtypes_url, notice: 'Auth tagtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_tagtype
      @auth_tagtype = AuthTagtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_tagtype_params
      params.require(:auth_tagtype).permit(:name)
    end
end
