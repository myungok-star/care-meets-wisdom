class AddVisitCompleteToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :visit_complete, :boolean
  end
end
