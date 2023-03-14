class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  attr_accessor :time_morning, :time_afternoon

  validates :date, :appointment_hour, :appointment_min, presence: true

  after_validation :set_dates

  private

  def set_dates
    self.start_date = self.date
    self.end_date = self.date
  end

  TIMES_MORNING = %w[7:00 7:15 7:30 7:45 8:00 8:15 8:30 8:45 9:00 9:15 9:30 9:45 10:00 10:15 10:30 10:45 11:00 11:15 11:30 11:45]
  TIMES_AFTERNOON = %w[1:00 1:15 1:30 1:45 2:00 2:15 2:30 2:45 3:00 3:15 3:30 3:45 4:00 4:15 4:30 4:45 5:00 5:15 5:30 5:45 6:00 6:15 6:30 6:45 7:00 7:15 7:30 7:45 ]

end
