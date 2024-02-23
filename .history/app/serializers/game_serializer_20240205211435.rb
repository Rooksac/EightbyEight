class GameSerializer < ActiveModel::Serializer
  attributes :id, :players, :result
end
