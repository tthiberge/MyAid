class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
  end

  def profile
    @user = current_user
  end

  def pills
    @pill_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @pill_prescriptions << prescription if prescription.treatment.category == "pills"
    end
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
