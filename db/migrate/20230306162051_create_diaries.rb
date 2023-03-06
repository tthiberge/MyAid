class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.integer :pain_scale
      t.integer :motivation_scale
      t.string :daily_feeling
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
