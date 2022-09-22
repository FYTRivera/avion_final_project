class HomepageController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      # @meetings = Meeting.all
    else
    end
  end

  def calendar
    if current_user.role == 1
      @meetings = Meeting.all
    elsif current_user.role == 0
      @meetings = Meeting.where(client_email: current_user.email)
    end
  end

  def available
    
      @meetings = Meeting.where(client_email: '', 
      start_time: Time.now..Time.now.end_of_month)
    
  end

  def scheduled
    if current_user.role == 1
      @meetings = Meeting.where.not(client_email: [nil,'']).where(start_time: Time.now.beginning_of_month..Time.now.end_of_month)
    elsif current_user.role == 0
      @meetings = Meeting.where(client_email: current_user.email, start_time: Time.now.beginning_of_month..Time.now.end_of_month)
    end
    
  end

  def unapproved
    if current_user.role == 1
    @meetings = Meeting.where.not(client_email: [nil,'']).where(is_approved: false).where(start_time: Time.now..Time.now.end_of_month)
    elsif current_user.role == 0
      @meetings = Meeting.where(client_email: current_user.email, is_approved: false, start_time: Time.now..Time.now.end_of_month)
    end

  end

end