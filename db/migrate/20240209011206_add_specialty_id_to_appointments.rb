class AddSpecialtyIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :specialty_id, :integer
  end
end
