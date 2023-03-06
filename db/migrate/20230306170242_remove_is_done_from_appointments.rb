class RemoveIsDoneFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :is_done
  end
end
