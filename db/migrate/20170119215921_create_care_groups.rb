class CreateCareGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :care_groups do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :about
      t.string :location
      t.string :contact

      t.timestamps
    end
  end
end
