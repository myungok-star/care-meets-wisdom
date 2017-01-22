class Visit < ApplicationRecord

  belongs_to :volunteer
  belongs_to :care_group
  belongs_to :senior

end
