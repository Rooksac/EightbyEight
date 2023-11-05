class Game < ApplicationRecord
    belongs_to :white_player, class_name: 'Student', foreign_key: 'white'
    belongs_to :black_player, class_name: 'Student', foreign_key: 'black'
end
