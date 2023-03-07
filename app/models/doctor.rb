class Doctor < ApplicationRecord
  has_many :appointments

  validates :name, :specialty, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
