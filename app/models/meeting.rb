class Meeting < ApplicationRecord
  belongs_to :user

  # before_update :set_client_email
  
  # def set_client_email
  #   if current_user.role == 1
  #     if self.client_email != ''
  #       self.is_booked = true 
  #     else
  #       self.is_booked = false
  #     end
  #   elsif current_user.role == 0
  #     if self.is_booked == true
  #       self.client_email = current_user.email
  #       # debugger
  #     else
  #       self.client_email = ''
  #     end
  #   end
  # end
end
