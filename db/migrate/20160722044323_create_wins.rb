class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.text :win
      t.belongs_to :journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
