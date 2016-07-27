class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :lesson
      t.belongs_to :journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
