class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :diaries, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :treatments, through: :prescriptions

  validates :first_name, :last_name, :birthdate, :address, presence: true
end
