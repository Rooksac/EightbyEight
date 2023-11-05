class ChangeMeetTimeDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :clubs, :meet_time, :time
  end
end
