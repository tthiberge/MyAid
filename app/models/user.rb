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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Pour faciliter les .pills / .cares / .exercises
  # fait appel aux méthodes self.pills/cares/exercises définies dans treatment.rb
  def pills
    treatments.pills
  end

  def cares
    treatments.cares
  end

  def exercises
    treatments.exercises
  end
end


# Scope qui ne marchait pas car s'applique sur une méthode de classe, alors qu'on veut sur instance
# scope :cares, -> { joins(:prescriptions).where('prescriptions.treatment.category == "cares"') }
# scope :pills, -> { joins(:prescriptions).where('prescriptions.treatment.category == "pills"') }
