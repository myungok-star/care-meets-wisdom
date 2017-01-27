class Senior < ApplicationRecord
    has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    belongs_to :care_group
    has_many :visits
    has_many :volunteers, through: :visits
end
