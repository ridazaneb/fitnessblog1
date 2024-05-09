class User < ApplicationRecord
    has_many :reviews
    has_many :plans
    has_many :exercise_records

end
