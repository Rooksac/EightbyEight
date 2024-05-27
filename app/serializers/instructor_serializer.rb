class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clubs, include_nested_associations: true

  def clubs
    object.clubs.map do |club|
      club_data = club.as_json
      # club_data['top_3'] = club.top_3
      # club_data['students'] = club.students
      club_data
    end
  end

  
end
