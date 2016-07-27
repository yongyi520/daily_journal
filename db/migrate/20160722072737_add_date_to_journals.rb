class AddDateToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :date, :date
  end
end
