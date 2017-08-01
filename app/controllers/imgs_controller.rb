class ImgsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
	before_action :set_img, only: [:show, :edit, :update, :destroy]

  # GET /imgs
  # GET /imgs.json
  def index
	@imgs = Img.order('id desc').paginate(:page => params[:page], :per_page => 20)
  end

  # GET /imgs/1
  # GET /imgs/1.json
  def show
  end

  # GET /imgs/new
  def new
    @img = Img.new
	if params[:modelname] && params[:uuid]
		@img.modelname ||= params[:modelname] 
		@img.uuid ||= params[:uuid]
	else
		redirect_to imgs_path
	end
  end

  # GET /imgs/1/edit
  def edit
  end

  # POST /imgs
  # POST /imgs.json
  def create
    @img = Img.new(img_params)

    respond_to do |format|
      if @img.save
        format.html { redirect_to @img, notice: 'Img was successfully created.' }
        format.json { render :show, status: :created, location: @img }
      else
        format.html { render :new }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imgs/1
  # PATCH/PUT /imgs/1.json
  def update
    respond_to do |format|
      if @img.update(img_params)
        format.html { redirect_to @img, notice: 'Img was successfully updated.' }
        format.json { render :show, status: :ok, location: @img }
      else
        format.html { render :edit }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgs/1
  # DELETE /imgs/1.json
  def destroy
    @img.destroy
    respond_to do |format|
      format.html { redirect_to imgs_url, notice: 'Img was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_img
      @img = Img.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def img_params
      params.require(:img).permit(:modelname, :uuid, :idx, :alt, :file)
    end
end
