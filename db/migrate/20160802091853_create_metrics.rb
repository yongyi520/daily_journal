class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :happiness
      t.boolean :meditation
      t.boolean :task_complete
      t.integer :masturbation
      t.belongs_to :journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
