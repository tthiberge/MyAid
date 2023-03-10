class AddDiaryToSelfy < ActiveRecord::Migration[7.0]
  def change
    add_reference :selfies, :diary, null: false, foreign_key: true
  end
end
