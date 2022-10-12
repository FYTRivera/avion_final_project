class Meeting < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time
  validate :reservations_must_not_overlap

  private

  def reservations_must_not_overlap
    return if self.class.where.not(id: id).where(user_id: user_id).where('start_time < ? AND end_time > ?', end_time, start_time).none?

    errors.add(:base, 'Overlapping reservation exists')
  end

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
 end
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
