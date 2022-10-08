class AddPaymentIdToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :payment_id, :string
  end
end
