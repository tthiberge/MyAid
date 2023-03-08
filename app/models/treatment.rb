class Treatment < ApplicationRecord
  has_many :prescriptions

  validates :name, :category, presence: true
  CATEGORIES = %w(pills cares exercises)
  validates :category, inclusion: { in: CATEGORIES }

  def self.pills
    where(category: "pills")
  end

  def self.cares
    where(category: "cares")
  end

  def self.exercises
    where(category: "exercises")
  end
end
