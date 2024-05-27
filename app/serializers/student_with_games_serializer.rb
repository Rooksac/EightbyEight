class StudentWithGamesSerializer < ActiveModel::Serializer
  attributes :id, :student_name, :grade, :games, :win_rate, :win_rate_black, :win_rate_white, :total_wins, :num_white_wins, :num_black_wins
end
