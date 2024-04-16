class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_name_black, :player_name_white, :result, :created_at
end