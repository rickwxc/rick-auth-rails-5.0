class Position2permissionsController < ApplicationController
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
	before_action :set_position2permission, only: [:show, :edit, :update, :destroy]

  # GET /position2permissions
  # GET /position2permissions.json
  def index
    @position2permissions = Position2permission.all
  end

  # GET /position2permissions/1
  # GET /position2permissions/1.json
  def show
  end

  # GET /position2permissions/new
  def new
    @position2permission = Position2permission.new
  end

  # GET /position2permissions/1/edit
  def edit
  end

  # POST /position2permissions
  # POST /position2permissions.json
  def create
    @position2permission = Position2permission.new(position2permission_params)

    respond_to do |format|
      if @position2permission.save
        format.html { redirect_to @position2permission, notice: 'Position2permission was successfully created.' }
        format.json { render :show, status: :created, location: @position2permission }
      else
        format.html { render :new }
        format.json { render json: @position2permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position2permissions/1
  # PATCH/PUT /position2permissions/1.json
  def update
    respond_to do |format|
      if @position2permission.update(position2permission_params)
        format.html { redirect_to @position2permission, notice: 'Position2permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @position2permission }
      else
        format.html { render :edit }
        format.json { render json: @position2permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position2permissions/1
  # DELETE /position2permissions/1.json
  def destroy
    @position2permission.destroy
    respond_to do |format|
      format.html { redirect_to position2permissions_url, notice: 'Position2permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position2permission
      @position2permission = Position2permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position2permission_params
      params.require(:position2permission).permit(:position_id, :permission_id)
    end
end
