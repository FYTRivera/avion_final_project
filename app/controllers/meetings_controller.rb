class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show edit update destroy ]

  # GET /meetings or /meetings.json
  def index
    # if current_user.role == 1
    #   @meetings = Meeting.all
    # else
    #   @meetings = Meeting.where(client_email: '')
    # end

    @meetings = Meeting.all

    @meetings.each do |meeting|
      @doctor = User.find(meeting.user_id)
    end
  end

  # GET /meetings/1 or /meetings/1.json
  def show
    @doctor = User.find(@meeting.user_id)
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.client_email != ''
      @meeting.is_booked = true 
    else
      @meeting.is_booked = false
    end

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
      if @meeting.is_booked == true
        @meeting.client_email = current_user.email
        # debugger
      else
      end
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

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id, :is_booked, :client_email)
    end
end
