class StudentWithGamesSerializer < ActiveModel::Serializer
  attributes :id, :student_name, :grade, :station, :win_rate, :win_rate_black, :win_rate_white, :total_wins, :num_white_wins, :num_black_wins, :average_grade, :number_of_lessons_completed, :most_recent_lesson, :number_of_games_played
end
