class AddUserReferenceToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :created_by_id, :integer, index: true
  end
end
