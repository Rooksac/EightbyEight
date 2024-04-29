class ClubSerializer < ActiveModel::Serializer
  attributes :id, :club_name, :school, :formatted_time, :top_3, :instructor_id
  has_many :students
end
