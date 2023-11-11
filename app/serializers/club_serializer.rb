class ClubSerializer < ActiveModel::Serializer
  attributes :id, :club_name, :school, :meet_time, :top_3
  has_many :students
end
