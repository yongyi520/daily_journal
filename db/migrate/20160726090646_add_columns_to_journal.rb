class AddColumnsToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :q1answers, :text
    add_column :journals, :q2answers, :text
    add_column :journals, :q3answers, :text
    add_column :journals, :q4answers, :text
  end
end
