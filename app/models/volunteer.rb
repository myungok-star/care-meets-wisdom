class Volunteer < ApplicationRecord
    has_attached_file :avatar, styles: { medium: '200x200>', thumb: '100x100>' }, default_url: 'https://share.okdothis.com/assets/default-avatar-c246f74ff56d382424ac2c750e40b0a6.png?w=64&h=64'
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: /@/
    validates :password, length: { minimum: 6 }, on: :create

    has_many :visits, dependent: :destroy
    has_many :seniors, through: :visits

    has_secure_password
end
