class AddReferenceToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :prescriptions, :treatment, null: false, foreign_key: true
  end
end
