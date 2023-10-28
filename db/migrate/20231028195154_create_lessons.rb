class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.integer :number_of_questions
      t.string :level

      t.timestamps
    end
  end
end
