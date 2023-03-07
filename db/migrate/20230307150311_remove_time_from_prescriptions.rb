class RemoveTimeFromPrescriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :prescriptions, :time
  end
end
