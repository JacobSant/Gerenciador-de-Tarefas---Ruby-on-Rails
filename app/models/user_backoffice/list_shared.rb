class UserBackoffice::ListShared < ApplicationRecord
  belongs_to :user_backoffice_task, class_name: 'UserBackoffice::Task', foreign_key: 'user_backoffice_task_id'
  belongs_to :user
end
