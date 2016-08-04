class AddMetricsToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :happiness, :integer
    add_column :journals, :meditation, :boolean
    add_column :journals, :task_complete, :boolean
    add_column :journals, :masturbation, :integer
  end
end
