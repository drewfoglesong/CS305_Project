class Teacher < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true
end
