class Doctor < ApplicationRecord
  has_many :appointments

  validates :name, :specialty, :address, presence: true
end
