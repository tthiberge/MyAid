class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @pill_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @pill_prescriptions << prescription if prescription.treatment.category == "pills"

    end

    @care_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @care_prescriptions << prescription if prescription.treatment.category == "cares"
    end

    @exercise_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @exercise_prescriptions << prescription if prescription.treatment.category == "exercises"
    end

    @appointments = []
    current_user.appointments.each do |appointment|
      @appointments << appointment
    end
  end

  def profile
    @user = current_user
  end

  def pills
    pill_prescriptions_all = []
    current_user.prescriptions.each do |prescription|
      pill_prescriptions_all << prescription if prescription.treatment.category == "pills"
    end

    pill_prescriptions_ongoing = pill_prescriptions_all.select {|prescription| Date.today.between?(prescription.start_date, prescription.end_date)}
    @pill_prescriptions_morning_afternoon = pill_prescriptions_ongoing.sort_by(&:day_half)

    # ⬇️ Marche pas! ça réorganise mes trucs!
    # @pill_prescriptions_hours = pill_prescriptions_morning_afternoon.sort_by!(&:todo_hours)
    # ⬇️ Donc là aussi ça va pas marcher!
    # .sort_by!(&:todo_minutes)
    # raise
  end

  def cares
    @care_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @care_prescriptions << prescription if prescription.treatment.category == "cares"
    end
  end

  def exercises
    @exercise_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @exercise_prescriptions << prescription if prescription.treatment.category == "exercises"
    end
  end

  def uikit
  end

  def landing
  end

end
