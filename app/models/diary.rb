class Diary < ApplicationRecord
  belongs_to :user
  has_many :selfies, dependent: :destroy
end
