class AddDayHalfToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :day_half, :string
  end
end
