class AddIsBookedToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :is_booked, :boolean, default: false
  end
end
