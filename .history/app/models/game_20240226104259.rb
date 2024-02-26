class Game < ApplicationRecord
    belongs_to :white_player, class_name: 'Student', foreign_key: 'white'
    belongs_to :black_player, class_name: 'Student', foreign_key: 'black'

    def players
        {
            white: self.white_player.student_name,
            black: self.black_player.student_name
        }
    end

    def self.in_progress(club_id)
        joins('LEFT JOIN students ON games.white = students.id OR games.black = students.id')
      .where('students.club_id = ? AND games.result IS NULL', club_id).distinct
    end

    def self.completed(club_id)
        joins('LEFT JOIN students ON games.white = students.id OR games.black = students.id')
        .where('students.club_id = ? AND (games.result = ? OR games.result = ?)', club_id, 'Black', 'White').distinct
    end

end
