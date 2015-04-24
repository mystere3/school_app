class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true
  
  validates :email, presence: true, uniqueness: true
end
