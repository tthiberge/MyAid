class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

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

  def exercices
    @exercice_prescriptions = []
    current_user.prescriptions.each do |prescription|
      @exercice_prescriptions << prescription if prescription.treatment.category == "exercices"
    end
  end
end
