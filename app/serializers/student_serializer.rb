class StudentSerializer < ActiveModel::Serializer
  attributes :id, :student_name, :win_rate, :total_wins
end
