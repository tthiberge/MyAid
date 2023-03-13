class Prescription < ApplicationRecord
  # Très UTILE pour définir des variables qui n'ont pas de réalité dans ma table de base de données
  # mais que je veux pouvoir appeler dans mon simple form
  # (normalement on ne peut appeler en face de f.input que des colonnes de la db)
  attr_accessor :treatment_name, :time, :treatment_category

  belongs_to :user
  belongs_to :treatment

  validates :start_date, :end_date, :todo_hours, :todo_minutes, presence: true

  scope :not_taken, -> { where(Date.today.between?(start_date:, end_date:))}

  CATEGORIES = %w(pills cares exercises)
  TIMES = %w[1:00 1:30 2:00 2:30 3:00 3:30 4:00 4:30 5:00 6:00 6:30 7:00 7:30 8:00 8:30 9:00 9:30 10:00 10:30 11:00 11:30]

end
