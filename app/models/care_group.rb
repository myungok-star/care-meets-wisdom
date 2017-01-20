class CareGroup < ApplicationRecord

  has_many :seniors, dependent: :destroy

  has_secure_password

end
