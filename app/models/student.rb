class Student < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 8 },
  					uniqueness: { case_sensitive: false }
end
