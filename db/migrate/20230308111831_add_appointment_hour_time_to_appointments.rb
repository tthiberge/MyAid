class AddAppointmentHourTimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :appointment_hour, :integer
    add_column :appointments, :appointment_min, :integer
  end
end
