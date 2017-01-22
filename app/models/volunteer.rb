class Volunteer < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :visits, dependent: :destroy
  has_many :care_groups, through: :visits

  has_secure_password

end
