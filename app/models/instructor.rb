class Instructor < ApplicationRecord
    has_many :clubs
    has_secure_password
end
