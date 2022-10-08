class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show edit update destroy ]
  

  # GET /meetings or /meetings.json
  def index
    if current_user.role == 1
      # @meetings = Meeting.all
      params[:q] ||= {}
      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
      end

      @q = Meeting.ransack(params[:q])
      @meetings = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
      @calendar_sessions = @q.result(distinct: true)
    elsif current_user.role == 0
      params[:q] ||= {}
      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
      end
      @q = Meeting.ransack(params[:q])
      @meetings = @q.result(distinct: true).where(client_email: current_user.email).paginate(page: params[:page], per_page: 5)
      @calendar_sessions = @q.result(distinct: true).where(client_email: current_user.email)
    end

    # @meetings = Meeting.all

    @meetings.each do |meeting|
      @doctor = User.find(meeting.user_id)
    end
  end

  # GET /meetings/1 or /meetings/1.json
  def show
    @doctor = User.find(@meeting.user_id)
    @get_link = Paymongo.get_link(@meeting.payment_id)
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    # @paymongo = Paymongo.paymongo
    # @test = Paymongo.result
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    # if current_user.role == 1
    #   if @meeting.client_email != ''
    #     @meeting.is_booked = true 
    #   else
    #     @meeting.is_booked = false
    #   end
    # elsif current_user.role == 0
    #   if @meeting.is_booked == true
    #     @meeting.client_email = current_user.email
    #     # debugger
    #   else
    #     @meeting.client_email = ''
    #   end
    # end

    @paymongo = Paymongo.paymongo
    @test = Paymongo.result
    @meeting.payment_id = @test["data"]["id"]

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_url(@meeting), notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update

    old_email = @meeting.client_email

    if @meeting.update(client_email_params)
      if old_email != @meeting.client_email
        BookedSessionMailer.with(meeting: @meeting).booked_session.deliver_later
        DoctorNewSessionMailer.with(meeting: @meeting).new_session_applied.deliver_later
        # ApprovalMailer.with(meeting: @meeting).approval_made.deliver_later
      end
    end

      if @meeting.is_approved == true
        ApprovalMailer.with(meeting: @meeting).approval_made.deliver_later
      end
    # if current_user.role == 0
    #   if @meeting.is_booked == true
    #     @meeting.client_email = current_user.email
        
    #   else
    #   end
    # else
    # end

    if current_user.role == 1
      if @meeting.client_email != ''
        @meeting.is_booked = true 
      else
        @meeting.is_booked = false
      end
    elsif current_user.role == 0
      # if @meeting.is_booked == true
      #   @meeting.client_email = current_user.email
      #   # debugger
      # else
      #   @meeting.client_email = ''
      # end
    end

    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to meeting_url(@meeting), notice: "Meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url, notice: "Meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # def set_client_email
    #   if current_user.role == 1
    #     if @meeting.client_email != ''
    #       @meeting.is_booked = true 
    #     else
    #       @meeting.is_booked = false
    #     end
    #   elsif current_user.role == 0
    #     if @meeting.is_booked == true
    #       @meeting.client_email = current_user.email
    #       # debugger
    #     else
    #       @meeting.client_email = ''
    #     end
    #   end
    # end

    # Only allow a list of trusted parameters through.
    def client_email_params
      params.require(:meeting).permit(:client_email)
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id, :is_booked, :client_email, :is_approved)
    end
end
