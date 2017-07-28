class AuthWebsitesController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_website, only: [:show, :edit, :update, :destroy]

  # GET /auth_websites
  # GET /auth_websites.json
  def index
    @auth_websites = AuthWebsite.all
  end

  # GET /auth_websites/1
  # GET /auth_websites/1.json
  def show
  end

  # GET /auth_websites/new
  def new
    @auth_website = AuthWebsite.new
  end

  # GET /auth_websites/1/edit
  def edit
  end

  # POST /auth_websites
  # POST /auth_websites.json
  def create
    @auth_website = AuthWebsite.new(auth_website_params)

    respond_to do |format|
      if @auth_website.save
        format.html { redirect_to @auth_website, notice: 'Auth website was successfully created.' }
        format.json { render :show, status: :created, location: @auth_website }
      else
        format.html { render :new }
        format.json { render json: @auth_website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_websites/1
  # PATCH/PUT /auth_websites/1.json
  def update
    respond_to do |format|
      if @auth_website.update(auth_website_params)
        format.html { redirect_to @auth_website, notice: 'Auth website was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_website }
      else
        format.html { render :edit }
        format.json { render json: @auth_website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_websites/1
  # DELETE /auth_websites/1.json
  def destroy
    @auth_website.destroy
    respond_to do |format|
      format.html { redirect_to auth_websites_url, notice: 'Auth website was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_website
      @auth_website = AuthWebsite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_website_params
      params.require(:auth_website).permit(:url, :sendfromemail, :replyemail, :shortname, :title, :descr, :mailapikey, :mailapiurl)
    end
end
