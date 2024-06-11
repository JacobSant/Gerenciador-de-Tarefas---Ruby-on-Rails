class UserBackoffice::Task < ApplicationRecord
  belongs_to :user
  has_many :user_backoffice_list_shareds, class_name: 'UserBackoffice::ListShared', dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
