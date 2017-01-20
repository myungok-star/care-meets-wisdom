class CreateSeniors < ActiveRecord::Migration[5.0]
  def change
    create_table :seniors do |t|
      t.belongs_to :care_group
      t.string :name
      t.string :about
      t.string :location
      t.string :interests

      t.timestamps
    end
  end
end
