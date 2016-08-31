class User2positionsController < ApplicationController
  before_action :set_user2position, only: [:show, :edit, :update, :destroy]

  # GET /user2positions
  # GET /user2positions.json
  def index
    @user2positions = User2position.all
  end

  # GET /user2positions/1
  # GET /user2positions/1.json
  def show
  end

  # GET /user2positions/new
  def new
    @user2position = User2position.new
  end

  # GET /user2positions/1/edit
  def edit
  end

  # POST /user2positions
  # POST /user2positions.json
  def create
    @user2position = User2position.new(user2position_params)

    respond_to do |format|
      if @user2position.save
        format.html { redirect_to @user2position, notice: 'User2position was successfully created.' }
        format.json { render :show, status: :created, location: @user2position }
      else
        format.html { render :new }
        format.json { render json: @user2position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user2positions/1
  # PATCH/PUT /user2positions/1.json
  def update
    respond_to do |format|
      if @user2position.update(user2position_params)
        format.html { redirect_to @user2position, notice: 'User2position was successfully updated.' }
        format.json { render :show, status: :ok, location: @user2position }
      else
        format.html { render :edit }
        format.json { render json: @user2position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user2positions/1
  # DELETE /user2positions/1.json
  def destroy
    @user2position.destroy
    respond_to do |format|
      format.html { redirect_to user2positions_url, notice: 'User2position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user2position
      @user2position = User2position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user2position_params
      params.require(:user2position).permit(:user_id, :position)
    end
end
