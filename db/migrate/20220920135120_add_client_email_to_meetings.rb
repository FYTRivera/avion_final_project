class AddClientEmailToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :client_email, :string
  end
end
