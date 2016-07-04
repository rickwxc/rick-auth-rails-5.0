class UmsController < ApplicationController
  before_action :set_um, only: [:show, :edit, :update, :destroy]

  # GET /ums
  # GET /ums.json
  def index
    @ums = Um.all
  end

  # GET /ums/1
  # GET /ums/1.json
  def show
  end

  # GET /ums/new
  def new
    @um = Um.new
  end

  # GET /ums/1/edit
  def edit
  end

  # POST /ums
  # POST /ums.json
  def create
    @um = Um.new(um_params)

    respond_to do |format|
      if @um.save
        format.html { redirect_to @um, notice: 'Um was successfully created.' }
        format.json { render :show, status: :created, location: @um }
      else
        format.html { render :new }
        format.json { render json: @um.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ums/1
  # PATCH/PUT /ums/1.json
  def update
    respond_to do |format|
      if @um.update(um_params)
        format.html { redirect_to @um, notice: 'Um was successfully updated.' }
        format.json { render :show, status: :ok, location: @um }
      else
        format.html { render :edit }
        format.json { render json: @um.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ums/1
  # DELETE /ums/1.json
  def destroy
    @um.destroy
    respond_to do |format|
      format.html { redirect_to ums_url, notice: 'Um was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_um
      @um = Um.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def um_params
      params.require(:um).permit(:user_id, :content, :provider)
    end
end
