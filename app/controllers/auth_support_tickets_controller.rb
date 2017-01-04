class AuthSupportTicketsController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 
  before_action :set_auth_support_ticket, only: [:show, :edit, :update, :destroy]

  def auth_support_ticket_reply
	  to = params[:to]
	  msg = params[:msg]

	  if to.include? '@'
		  #send email
	  end

	  rs = {
		  'rs' => 1
	  }

	  render :json => rs
  end

  # GET /auth_support_tickets
  # GET /auth_support_tickets.json
  def index
	  auth_reasonst_id = params[:auth_reasonst_id]
	  if auth_reasonst_id
		  @auth_support_tickets = AuthSupportTicket.where(:auth_reasonst_id => auth_reasonst_id).order('id desc').paginate(:page => params[:page], :per_page => 10)
	  else
		  @auth_support_tickets = AuthSupportTicket.order('id desc').paginate(:page => params[:page], :per_page => 10)
	  end
  end

  # GET /auth_support_tickets/1
  # GET /auth_support_tickets/1.json
  def show
  end

  # GET /auth_support_tickets/new
  def new
    @auth_support_ticket = AuthSupportTicket.new
  end

  # GET /auth_support_tickets/1/edit
  def edit
  end

  # POST /auth_support_tickets
  # POST /auth_support_tickets.json
  def create
    @auth_support_ticket = AuthSupportTicket.new(auth_support_ticket_params)

    respond_to do |format|
      if @auth_support_ticket.save
        format.html { redirect_to @auth_support_ticket, notice: 'Auth support ticket was successfully created.' }
        format.json { render :show, status: :created, location: @auth_support_ticket }
      else
        format.html { render :new }
        format.json { render json: @auth_support_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_support_tickets/1
  # PATCH/PUT /auth_support_tickets/1.json
  def update
    respond_to do |format|
      if @auth_support_ticket.update(auth_support_ticket_params)
        format.html { redirect_to @auth_support_ticket, notice: 'Auth support ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_support_ticket }
      else
        format.html { render :edit }
        format.json { render json: @auth_support_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_support_tickets/1
  # DELETE /auth_support_tickets/1.json
  def destroy
    @auth_support_ticket.destroy
    respond_to do |format|
      format.html { redirect_to auth_support_tickets_url, notice: 'Auth support ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_support_ticket
      @auth_support_ticket = AuthSupportTicket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_support_ticket_params
      params.require(:auth_support_ticket).permit(:email, :mobile, :user_id, :auth_reason_id,:auth_reasonst_id,:note)
    end
end
