class Diary < ApplicationRecord
  belongs_to :user
  has_one :selfy, dependent: :destroy
end
