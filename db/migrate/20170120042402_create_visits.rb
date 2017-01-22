class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.belongs_to :volunteer
      t.belongs_to :senior
      t.belongs_to :care_group
      t.boolean :pending
      t.boolean :approved
      t.string :date

      t.timestamps
    end
  end
end
