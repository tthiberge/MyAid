class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validate :date, :time
end
