class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date, :appointment_hour, :appointment_min, :title, presence: true
end
