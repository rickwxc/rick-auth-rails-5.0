class AuthWebsite2tagsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_website2tag, only: [:show, :edit, :update, :destroy]

  # GET /auth_website2tags
  # GET /auth_website2tags.json
  def index
    @auth_website2tags = AuthWebsite2tag.all
  end

  # GET /auth_website2tags/1
  # GET /auth_website2tags/1.json
  def show
  end

  # GET /auth_website2tags/new
  def new
    @auth_website2tag = AuthWebsite2tag.new
  end

  # GET /auth_website2tags/1/edit
  def edit
  end

  # POST /auth_website2tags
  # POST /auth_website2tags.json
  def create
    @auth_website2tag = AuthWebsite2tag.new(auth_website2tag_params)

    respond_to do |format|
      if @auth_website2tag.save
        format.html { redirect_to @auth_website2tag, notice: 'Auth website2tag was successfully created.' }
        format.json { render :show, status: :created, location: @auth_website2tag }
      else
        format.html { render :new }
        format.json { render json: @auth_website2tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_website2tags/1
  # PATCH/PUT /auth_website2tags/1.json
  def update
    respond_to do |format|
      if @auth_website2tag.update(auth_website2tag_params)
        format.html { redirect_to @auth_website2tag, notice: 'Auth website2tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_website2tag }
      else
        format.html { render :edit }
        format.json { render json: @auth_website2tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_website2tags/1
  # DELETE /auth_website2tags/1.json
  def destroy
    @auth_website2tag.destroy
    respond_to do |format|
      format.html { redirect_to auth_website2tags_url, notice: 'Auth website2tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_website2tag
      @auth_website2tag = AuthWebsite2tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_website2tag_params
      params.require(:auth_website2tag).permit(:auth_website_id, :auth_tag_id, :idx)
    end
end
