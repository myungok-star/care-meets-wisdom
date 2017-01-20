class Volunteer < ApplicationRecord

  has_many :visits, dependent: :destroy
  has_many :seniors, through: :visits

  has_secure_password

end
