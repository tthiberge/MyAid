class SimpleCalendarController < ApplicationController

  def calendar
    @appointments = current_user.appointments
    @pill_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "pills" })
    @care_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "cares" })
    @exercise_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "exercises" })

    @events = @appointments + @pill_prescriptions + @care_prescriptions + @exercise_prescriptions

    @start_date = Date.current.beginning_of_month
    @end_date = Date.current.end_of_month
  end 


  def month_calendar
  end

  def week_calendar
  end

end
