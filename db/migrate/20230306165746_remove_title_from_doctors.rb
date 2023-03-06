class RemoveTitleFromDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :title
  end
end
