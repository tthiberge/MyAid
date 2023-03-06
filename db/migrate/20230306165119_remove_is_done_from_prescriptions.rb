class RemoveIsDoneFromPrescriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :prescriptions, :is_done
  end
end
