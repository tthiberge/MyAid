class AddColumnsToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :todo_hours, :integer
    add_column :prescriptions, :todo_minutes, :integer
  end
end
