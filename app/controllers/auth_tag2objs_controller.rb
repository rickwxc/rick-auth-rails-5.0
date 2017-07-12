class AuthTag2objsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_tag2obj, only: [:show, :edit, :update, :destroy]

  # GET /auth_tag2objs
  # GET /auth_tag2objs.json
  def index
    @auth_tag2objs = AuthTag2obj.all
  end

  # GET /auth_tag2objs/1
  # GET /auth_tag2objs/1.json
  def show
  end

  # GET /auth_tag2objs/new
  def new
    @auth_tag2obj = AuthTag2obj.new
  end

  # GET /auth_tag2objs/1/edit
  def edit
  end

  # POST /auth_tag2objs
  # POST /auth_tag2objs.json
  def create
    @auth_tag2obj = AuthTag2obj.new(auth_tag2obj_params)

    respond_to do |format|
      if @auth_tag2obj.save
        format.html { redirect_to @auth_tag2obj, notice: 'Auth tag2obj was successfully created.' }
        format.json { render :show, status: :created, location: @auth_tag2obj }
      else
        format.html { render :new }
        format.json { render json: @auth_tag2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_tag2objs/1
  # PATCH/PUT /auth_tag2objs/1.json
  def update
    respond_to do |format|
      if @auth_tag2obj.update(auth_tag2obj_params)
        format.html { redirect_to @auth_tag2obj, notice: 'Auth tag2obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_tag2obj }
      else
        format.html { render :edit }
        format.json { render json: @auth_tag2obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_tag2objs/1
  # DELETE /auth_tag2objs/1.json
  def destroy
    @auth_tag2obj.destroy
    respond_to do |format|
      format.html { redirect_to auth_tag2objs_url, notice: 'Auth tag2obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_tag2obj
      @auth_tag2obj = AuthTag2obj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_tag2obj_params
      params.require(:auth_tag2obj).permit(:model, :auth_obj_id, :auth_tag_id)
    end
end
