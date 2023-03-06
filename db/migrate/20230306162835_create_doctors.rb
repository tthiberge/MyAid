class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :title
      t.string :name
      t.string :specialty
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
