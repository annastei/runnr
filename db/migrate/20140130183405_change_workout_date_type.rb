class ChangeWorkoutDateType < ActiveRecord::Migration

  def self.up
    change_column :workouts, :date, :date
  end
 
  def self.down
    change_column :workouts, :date, :datetime
  end

end
