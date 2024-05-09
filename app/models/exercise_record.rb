class ExerciseRecord < ApplicationRecord
  belongs_to :exercise
  belongs_to :user, foreign_key: 'username', primary_key: 'username'

end
