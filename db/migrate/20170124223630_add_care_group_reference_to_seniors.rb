class AddCareGroupReferenceToSeniors < ActiveRecord::Migration[5.0]
  def change
    add_reference :care_groups, :senior, foreign_key: true
  end
end
