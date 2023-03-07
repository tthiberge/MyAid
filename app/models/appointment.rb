class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date, :time, presence: true
end
