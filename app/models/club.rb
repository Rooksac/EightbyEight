class Club < ApplicationRecord
    belongs_to :instructor
    has_many :students
end
