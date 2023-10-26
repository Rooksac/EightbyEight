class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
