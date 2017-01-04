class AuthReasonsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_reason, only: [:show, :edit, :update, :destroy]

  # GET /auth_reasons
  # GET /auth_reasons.json
  def index
    @auth_reasons = AuthReason.all
  end

  # GET /auth_reasons/1
  # GET /auth_reasons/1.json
  def show
  end

  # GET /auth_reasons/new
  def new
    @auth_reason = AuthReason.new
  end

  # GET /auth_reasons/1/edit
  def edit
  end

  # POST /auth_reasons
  # POST /auth_reasons.json
  def create
    @auth_reason = AuthReason.new(auth_reason_params)

    respond_to do |format|
      if @auth_reason.save
        format.html { redirect_to @auth_reason, notice: 'Auth reason was successfully created.' }
        format.json { render :show, status: :created, location: @auth_reason }
      else
        format.html { render :new }
        format.json { render json: @auth_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_reasons/1
  # PATCH/PUT /auth_reasons/1.json
  def update
    respond_to do |format|
      if @auth_reason.update(auth_reason_params)
        format.html { redirect_to @auth_reason, notice: 'Auth reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_reason }
      else
        format.html { render :edit }
        format.json { render json: @auth_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_reasons/1
  # DELETE /auth_reasons/1.json
  def destroy
    @auth_reason.destroy
    respond_to do |format|
      format.html { redirect_to auth_reasons_url, notice: 'Auth reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_reason
      @auth_reason = AuthReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_reason_params
      params.require(:auth_reason).permit(:long, :short, :descr)
    end
end
