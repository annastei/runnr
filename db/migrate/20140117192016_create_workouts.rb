class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :date
      t.float :distance
      t.integer :duration
      t.text :comment

      t.timestamps
    end
  end
end
