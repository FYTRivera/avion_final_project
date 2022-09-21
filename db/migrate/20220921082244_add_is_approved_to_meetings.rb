class AddIsApprovedToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :is_approved, :boolean, default: false
  end
end
