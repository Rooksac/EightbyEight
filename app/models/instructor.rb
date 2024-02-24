class Instructor < ApplicationRecord
    has_many :clubs
    has_many :students, through: :clubs
    has_many :lessons
    has_secure_password
end
