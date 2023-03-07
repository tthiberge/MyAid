class Treatment < ApplicationRecord
  has_many :prescriptions

  validates :name, :category, presence: true
  CATEGORIES = %w(pills cares exercises)
  validates :category, inclusion: { in: CATEGORIES }
end
