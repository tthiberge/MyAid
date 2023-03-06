class Doctor < ApplicationRecord
  has_many :appointments

  validate :name, :specialty, :address
end
