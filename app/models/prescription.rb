class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :treatment

  validate :start_date, :end_date, :time
end
