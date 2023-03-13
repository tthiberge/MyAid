class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date, :appointment_hour, :appointment_min, presence: true

  after_validation :set_dates

  private

  def set_dates
    self.start_date = self.date
    self.end_date = self.date
  end
end
