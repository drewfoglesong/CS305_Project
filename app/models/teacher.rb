class Teacher < ActiveRecord::Base
  cattr_accessor :current_teacher
  validates :name, presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true
end
