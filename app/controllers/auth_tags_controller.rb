class AuthTagsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_tag, only: [:show, :edit, :update, :destroy]

  # GET /auth_tags
  # GET /auth_tags.json
  def index
    @auth_tags = AuthTag.all
  end

  # GET /auth_tags/1
  # GET /auth_tags/1.json
  def show
  end

  # GET /auth_tags/new
  def new
    @auth_tag = AuthTag.new
  end

  # GET /auth_tags/1/edit
  def edit
  end

  # POST /auth_tags
  # POST /auth_tags.json
  def create
    @auth_tag = AuthTag.new(auth_tag_params)

    respond_to do |format|
      if @auth_tag.save
        format.html { redirect_to @auth_tag, notice: 'Auth tag was successfully created.' }
        format.json { render :show, status: :created, location: @auth_tag }
      else
        format.html { render :new }
        format.json { render json: @auth_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_tags/1
  # PATCH/PUT /auth_tags/1.json
  def update
    respond_to do |format|
      if @auth_tag.update(auth_tag_params)
        format.html { redirect_to @auth_tag, notice: 'Auth tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_tag }
      else
        format.html { render :edit }
        format.json { render json: @auth_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_tags/1
  # DELETE /auth_tags/1.json
  def destroy
    @auth_tag.destroy
    respond_to do |format|
      format.html { redirect_to auth_tags_url, notice: 'Auth tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_tag
      @auth_tag = AuthTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_tag_params
      params.require(:auth_tag).permit(:name, :auth_tagtype_id)
    end
end
