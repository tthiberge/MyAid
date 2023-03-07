class Treatment < ApplicationRecord
  has_many :prescriptions

  validates :name, :category, presence: true
  CATEGORIES = %(pills cares exercices)
  validates :category, inclusion: { in: CATEGORIES }
end
