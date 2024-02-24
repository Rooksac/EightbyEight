class UpdateLessonModel < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :instructor_id, :integer

    add_column :lessons, :description, :string

    rename_column :lessons, :level, :source
  end
end
