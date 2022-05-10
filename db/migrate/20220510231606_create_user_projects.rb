class CreateUserProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :user_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: { to_table: :users }
      t.references :requester, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
