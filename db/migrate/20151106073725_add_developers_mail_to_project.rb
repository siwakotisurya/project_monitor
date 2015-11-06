class AddDevelopersMailToProject < ActiveRecord::Migration
  def change
    add_column :projects, :developer_mail, :string
  end
end
