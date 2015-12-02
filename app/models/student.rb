class Student < ActiveRecord::Base
has_many :scores
validates :name,  presence: true, length: { maximum: 8 },
  					uniqueness: { case_sensitive: false }
end
