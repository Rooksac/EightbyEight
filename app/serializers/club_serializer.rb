class ClubSerializer < ActiveModel::Serializer
  attributes :id, :club_name, :school, :formatted_time, :top_3_games, top_3_lessons, :instructor_id
  has_many :students
end
