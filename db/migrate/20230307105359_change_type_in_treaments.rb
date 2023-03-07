class ChangeTypeInTreaments < ActiveRecord::Migration[7.0]
  def change
    rename_column :treatments, :type, :category
  end
end
