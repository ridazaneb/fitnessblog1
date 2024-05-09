json.extract! exercise_record, :id, :exercise_id, :time, :speed, :calories, :created_at, :updated_at
json.url exercise_record_url(exercise_record, format: :json)
