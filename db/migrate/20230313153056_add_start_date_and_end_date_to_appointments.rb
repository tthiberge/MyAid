class AddStartDateAndEndDateToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :start_date, :datetime
    add_column :appointments, :end_date, :datetime
  end
end
