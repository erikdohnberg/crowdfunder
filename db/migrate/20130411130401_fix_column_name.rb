class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :pledges, :project_id_id, :project_id
    rename_column :pledges, :user_id_id, :user_id
  end
end