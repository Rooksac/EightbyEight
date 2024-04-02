class AddColumnsToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :player_name_white, :string

    add_column :games, :player_name_black, :string
  end
end
