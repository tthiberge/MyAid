class AddColumnDayHalfToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :day_half, :string
  end
end
