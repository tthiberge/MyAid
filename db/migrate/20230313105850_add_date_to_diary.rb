class AddDateToDiary < ActiveRecord::Migration[7.0]
  def change
    t.date :date
  end
end
