class AddIsPaidToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :is_paid, :boolean, deafult: false
  end
end
