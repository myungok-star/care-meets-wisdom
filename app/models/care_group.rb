class CareGroup < ApplicationRecord
    has_attached_file :photo, styles: { medium: '200x200>', thumb: '100x100>' }, default_url: 'http://i.imgur.com/9JlhmGx.png'
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: /@/
    validates :password, length: { minimum: 6 }, on: :create

    has_many :seniors, dependent: :destroy

    has_secure_password
end
