class RemoveColumnFromStudentLessons < ActiveRecord::Migration[7.0]
  def change
    remove_column :student_lessons, :completed
  end
end
