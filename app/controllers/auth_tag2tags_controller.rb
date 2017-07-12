class AuthTag2tagsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_tag2tag, only: [:show, :edit, :update, :destroy]

  # GET /auth_tag2tags
  # GET /auth_tag2tags.json
  def index
    @auth_tag2tags = AuthTag2tag.all
  end

  # GET /auth_tag2tags/1
  # GET /auth_tag2tags/1.json
  def show
  end

  # GET /auth_tag2tags/new
  def new
    @auth_tag2tag = AuthTag2tag.new
  end

  # GET /auth_tag2tags/1/edit
  def edit
  end

  # POST /auth_tag2tags
  # POST /auth_tag2tags.json
  def create
    @auth_tag2tag = AuthTag2tag.new(auth_tag2tag_params)

    respond_to do |format|
      if @auth_tag2tag.save
        format.html { redirect_to @auth_tag2tag, notice: 'Auth tag2tag was successfully created.' }
        format.json { render :show, status: :created, location: @auth_tag2tag }
      else
        format.html { render :new }
        format.json { render json: @auth_tag2tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_tag2tags/1
  # PATCH/PUT /auth_tag2tags/1.json
  def update
    respond_to do |format|
      if @auth_tag2tag.update(auth_tag2tag_params)
        format.html { redirect_to @auth_tag2tag, notice: 'Auth tag2tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_tag2tag }
      else
        format.html { render :edit }
        format.json { render json: @auth_tag2tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_tag2tags/1
  # DELETE /auth_tag2tags/1.json
  def destroy
    @auth_tag2tag.destroy
    respond_to do |format|
      format.html { redirect_to auth_tag2tags_url, notice: 'Auth tag2tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_tag2tag
      @auth_tag2tag = AuthTag2tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_tag2tag_params
      params.require(:auth_tag2tag).permit(:ptag_id, :ctag_id)
    end
end
