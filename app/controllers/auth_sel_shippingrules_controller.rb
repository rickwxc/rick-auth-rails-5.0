class AuthSelShippingrulesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_sel_shippingrule, only: [:show, :edit, :update, :destroy]

  # GET /auth_sel_shippingrules
  # GET /auth_sel_shippingrules.json
  def index
    @auth_sel_shippingrules = AuthSelShippingrule.all
  end

  # GET /auth_sel_shippingrules/1
  # GET /auth_sel_shippingrules/1.json
  def show
  end

  # GET /auth_sel_shippingrules/new
  def new
    @auth_sel_shippingrule = AuthSelShippingrule.new
  end

  # GET /auth_sel_shippingrules/1/edit
  def edit
  end

  # POST /auth_sel_shippingrules
  # POST /auth_sel_shippingrules.json
  def create
    @auth_sel_shippingrule = AuthSelShippingrule.new(auth_sel_shippingrule_params)

    respond_to do |format|
      if @auth_sel_shippingrule.save
        format.html { redirect_to @auth_sel_shippingrule, notice: 'Auth sel shippingrule was successfully created.' }
        format.json { render :show, status: :created, location: @auth_sel_shippingrule }
      else
        format.html { render :new }
        format.json { render json: @auth_sel_shippingrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_sel_shippingrules/1
  # PATCH/PUT /auth_sel_shippingrules/1.json
  def update
    respond_to do |format|
      if @auth_sel_shippingrule.update(auth_sel_shippingrule_params)
        format.html { redirect_to @auth_sel_shippingrule, notice: 'Auth sel shippingrule was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_sel_shippingrule }
      else
        format.html { render :edit }
        format.json { render json: @auth_sel_shippingrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_sel_shippingrules/1
  # DELETE /auth_sel_shippingrules/1.json
  def destroy
    @auth_sel_shippingrule.destroy
    respond_to do |format|
      format.html { redirect_to auth_sel_shippingrules_url, notice: 'Auth sel shippingrule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_sel_shippingrule
      @auth_sel_shippingrule = AuthSelShippingrule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_sel_shippingrule_params
      params.require(:auth_sel_shippingrule).permit(:name, :cost, :idx)
    end
end
