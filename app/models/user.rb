class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_backoffice_tasks, class_name: 'UserBackoffice::Task', dependent: :destroy
  has_many :user_backoffice_list_shareds, class_name: 'UserBackoffice::ListShared', dependent: :destroy
end
