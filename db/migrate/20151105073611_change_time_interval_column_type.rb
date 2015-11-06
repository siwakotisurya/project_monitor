class ChangeTimeIntervalColumnType < ActiveRecord::Migration
  def change
    change_column :projects, :time_interval, :string
  end
end
