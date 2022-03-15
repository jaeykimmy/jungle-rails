class User < ActiveRecord::Base

  
  has_secure_password
  validates :password, length: {in: 6..40}, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
  
end
