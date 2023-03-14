class ChangeTakenDateInPrescriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :prescriptions, :taken_date, :date, default: Date.new(1900)
  end
end
