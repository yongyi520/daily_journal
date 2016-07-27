class AddImprovementToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :improvement, :text
  end
end
