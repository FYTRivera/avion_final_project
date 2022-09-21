class HomepageController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      # @meetings = Meeting.all
    else
    end
  end

  def calendar
    @meetings = Meeting.all
  end

  def available
    @meetings = Meeting.where(client_email: '', 
    start_time: Time.now..Time.now.end_of_month.end_of_week)
  end

  def scheduled
    @meetings = Meeting.where.not(client_email: [nil,'']).where(start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
  end

  def unapproved
    @meetings = Meeting.where.not(client_email: [nil,'']).where(is_approved: false).where(start_time: Time.now..Time.now.end_of_month.end_of_week)
  end

end