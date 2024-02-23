class GameSerializer < ActiveModel::Serializer
  attributes :id, :players, :result, :created_at
end
