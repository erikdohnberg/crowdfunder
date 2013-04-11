class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.references :user_id
      t.references :project_id

      t.timestamps
    end
  end
end
