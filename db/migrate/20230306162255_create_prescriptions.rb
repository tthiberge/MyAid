class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.date :start_date
      t.date :end_date
      t.time :time
      t.string :comment
      t.boolean :is_done
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
