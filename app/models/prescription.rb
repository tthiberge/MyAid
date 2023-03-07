class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :treatment

  validates :start_date, :end_date, :time, presence: true
end
