class AddSpecialtyIdToDoctors < ActiveRecord::Migration[7.1]
  def change
    change_column :doctors, :specialty_id, :integer, null: true
  end
end
