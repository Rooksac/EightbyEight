class ClubSerializer < ActiveModel::Serializer
  attributes :id, :club_name, :school, :meet_time, :instructor_id
  has_many :students
end
