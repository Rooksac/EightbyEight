class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :school
      t.datetime :meet_time
      t.integer :instructor_id

      t.timestamps
    end
  end
end
