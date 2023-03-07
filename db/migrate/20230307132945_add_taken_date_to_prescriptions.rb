class AddTakenDateToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :taken_date, :date
  end
end
