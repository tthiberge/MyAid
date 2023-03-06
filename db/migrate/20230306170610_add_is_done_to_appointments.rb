class AddIsDoneToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :is_done, :boolean, default: false
  end
end
