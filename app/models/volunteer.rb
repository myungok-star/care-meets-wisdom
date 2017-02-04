class Volunteer < ApplicationRecord
    has_attached_file :avatar, styles: { medium: '200x200>', thumb: '100x100>' }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: /@/
    validates :password, length: { minimum: 6 }, on: :create

    has_many :visits, dependent: :destroy
    has_many :seniors, through: :visits

    has_secure_password
end
