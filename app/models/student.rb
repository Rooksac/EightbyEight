class Student < ApplicationRecord
    belongs_to :club
    has_many :student_lessons, dependent: :destroy
    has_many :lessons, through: :student_lessons
    has_many :games_as_white, class_name: 'Game', foreign_key: 'white'
    has_many :games_as_black, class_name: 'Game', foreign_key: 'black'


    def games
        Game.where('white = ? OR black = ?', id, id)
    end

    def number_of_games_played
        games_as_white.count + games_as_black.count
    end

    def win_rate
        total_games = number_of_games_played
        return 0 if total_games.zero?

        total_wins / total_games.to_f
    end

    def num_white_wins
        games_as_white.where(result: 'White').count
    end

    def num_black_wins
        games_as_black.where(result: 'Black').count
    end

    def win_rate_white
        total_games_as_white = games_as_white.count
        return 0 if total_games_as_white.zero?
        games_as_white.where(result: 'White').count.to_f / total_games_as_white * 100
    end

    def win_rate_black
        total_games_as_black = games_as_black.count
        return 0 if total_games_as_black.zero?

        games_as_black.where(result: 'Black').count.to_f / total_games_as_black * 100
    end

    def total_wins
        winning_games_as_white = games_as_white.where(result: 'White').count
        winning_games_as_black = games_as_black.where(result: 'Black').count
        drawn_games = self.games.where(result: 'Draw').count * 0.5

        winning_games_as_black + winning_games_as_white + drawn_games
    end

    def completed_lessons
        self.lessons.map {|lesson| lesson.id}
    end

    def lesson_scores
        self.student_lessons.includes(:lesson).map do |student_lesson|
            {
                lesson_name: student_lesson.lesson.lesson_name,
                lesson_source: student_lesson.lesson.source,
                grade: student_lesson.lesson_grade,
                number_of_questions: student_lesson.lesson.number_of_questions,
                note: student_lesson.notes
            }
        end
    end

end
