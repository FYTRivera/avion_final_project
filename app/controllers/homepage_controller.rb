class HomepageController < ApplicationController
    def index
      if user_signed_in?
        @user = User.find(current_user.id)
      else
      end
    end
  end