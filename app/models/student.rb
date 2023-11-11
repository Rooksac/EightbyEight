class Student < ApplicationRecord
    belongs_to :club
    has_many :student_lessons
    has_many :lessons, through: :student_lessons
    has_many :games_as_white, class_name: 'Game', foreign_key: 'white'
    has_many :games_as_black, class_name: 'Game', foreign_key: 'black'


    def games
        games_as_white + games_as_black
    end

    def number_of_games_played
        games_as_white.count + games_as_black.count
    end

    def win_rate
        total_games = number_of_games_played
        return 0 if total_games.zero?

        winning_games_as_white = games_as_white.where(result: 'White').count
        winning_games_as_black = games_as_black.where(result: 'Black').count

        (winning_games_as_white + winning_games_as_black) / total_games.to_f
    end

    def win_rate_white
        total_games_as_white = games_as_white.count
        return 0 if total_games_as_white.zero?
        total_games_as_white/games_as_white.where(result: 'White').count.to_f
    end

    def win_rate_black
        total_games_as_black = games_as_black.count
        return 0 if total_games_as_black.zero?

        total_games_as_black/games_as_black.where(result: 'Black').count.to_f
    end

    def total_wins
        winning_games_as_white = games_as_white.where(result: 'White').count
        winning_games_as_black = games_as_black.where(result: 'Black').count

        winning_games_as_black + winning_games_as_white
    end

end
