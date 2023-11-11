class StudentSerializer < ActiveModel::Serializer
  attributes :id, :student_name, :grade, :games, :win_rate, :win_rate_black, :win_rate_white
  
end
