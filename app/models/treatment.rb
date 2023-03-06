class Treatment < ApplicationRecord
  has_many :prescriptions

  validate :name, :type
end
