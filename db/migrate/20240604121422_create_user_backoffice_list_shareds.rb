class CreateUserBackofficeListShareds < ActiveRecord::Migration[7.1]
  def change
    create_table :user_backoffice_list_shareds do |t|
      t.references :user_backoffice_task, null: false, foreign_key: { to_table: :user_backoffice_tasks }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end