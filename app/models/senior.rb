class Senior < ApplicationRecord

  belongs_to :care_group
  has_many :visits, dependent: :destroy
  has_many :volunteers, through: :visits

end
