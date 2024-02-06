class Game < ApplicationRecord
    belongs_to :white_player, class_name: 'Student', foreign_key: 'white'
    belongs_to :black_player, class_name: 'Student', foreign_key: 'black'

    def players
        {
            white: self.white_player.student_name,
            black: self.black_player.student_name
        }
    end

    def in_progress(club_id)
        Game.joins(student: :club).where(clubs: { id: club_id }).where(result: nil)
    end

end
