class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :service_name, :string
    add_column :projects, :website, :string
    add_column :projects, :time_interval, :integer
  end
end
