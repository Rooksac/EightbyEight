class StudentSerializer < ActiveModel::Serializer
  attributes :id, :student_name, :station, :win_rate, :total_wins
end
