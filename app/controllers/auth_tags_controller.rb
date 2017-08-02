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

  def auth_tag_merge
	  if !params[:from_tag]
		  return
	  end

	  if params[:from_tag] == params[:into_tag]
		  render :plain => 'same from and intos, no action performed.'
		  return
	  end


	  from_tag_id =  params[:from_tag]
	  into_tag_id =  params[:into_tag]
	  t2o = AuthTag2obj.where(:auth_tag_id => from_tag_id)

	  t2o.each do |v|
		  AuthTag2obj.find_or_create_by(:model => v.model, :auth_obj_id => v.auth_obj_id, :auth_tag_id => into_tag_id)
		  if params[:delete_from] 
			  v.destroy
		  end
	  end
	  
	  if params[:delete_from] 
		  AuthTag2tag.delete_all(["ctag_id = ?", from_tag_id])
		  AuthTag2tag.delete_all(["ptag_id = ?", from_tag_id])
		  AuthWebsite2tag.delete_all(["auth_tag_id = ?", from_tag_id])
		  AuthTag.delete_all(["id = ?", from_tag_id])
	  end

	  render :plain => 'success & done!'
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
	  @pids = @auth_tag.get_parent_ids
	  @webrootids = @auth_tag.get_webroot_ids
  end

  # POST /auth_tags
  # POST /auth_tags.json
  def create
    @auth_tag = AuthTag.new(auth_tag_params)


    respond_to do |format|
      if @auth_tag.save

		  params[:ptags].each do |v|
			  AuthTag2tag.find_or_create_by(:ptag_id => v, :ctag_id => @auth_tag.id)
		  end if (params[:ptags])

		  params[:webroot].each do |v|
			  tt = AuthWebsite2tag.new
			  tt.auth_website_id = v
			  tt.auth_tag_id = @auth_tag.id
			  tt.save
		  end if params[:webroot]


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

	  AuthTag2tag.delete_all(["ctag_id = ?", @auth_tag.id])
	  AuthWebsite2tag.delete_all(["auth_tag_id = ?", @auth_tag.id])


	  params[:ptags].each do |v|
		  AuthTag2tag.find_or_create_by(:ptag_id => v, :ctag_id => @auth_tag.id)
	  end if params[:ptags] 

	  params[:webroot].each do |v|
		  tt = AuthWebsite2tag.new
		  tt.auth_website_id = v
		  tt.auth_tag_id = @auth_tag.id
		  tt.save
	  end if params[:webroot]

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
      params.require(:auth_tag).permit(:name)
    end
end
