class CreateStudentLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :student_lessons do |t|
      t.integer :student_id
      t.integer :lesson_id
      t.boolean :completed
      t.integer :lesson_grade
      t.string :notes

      t.timestamps
    end
  end
end
