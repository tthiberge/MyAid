class RemovePhotoFromDiaries < ActiveRecord::Migration[7.0]
  def change
    remove_column :diaries, :photo, :string
  end
end
