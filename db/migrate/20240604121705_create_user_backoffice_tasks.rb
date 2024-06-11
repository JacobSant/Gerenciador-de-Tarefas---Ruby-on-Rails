class CreateUserBackofficeTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_backoffice_tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.integer :shared
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
