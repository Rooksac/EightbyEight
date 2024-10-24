class AddStationToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :station, :integer
  end
end
