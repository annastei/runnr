json.array!(@workouts) do |workout|
  json.extract! workout, :id, :date, :distance, :duration, :comment
  json.url workout_url(workout, format: :json)
end
