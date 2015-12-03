class Student < ActiveRecord::Base
has_many :scores
validates :name,  presence: true, length: { maximum: 6 },
  					uniqueness: { case_sensitive: false },
  					format: { with: /\b[a-zA-Z]{4}\d{2}\b/ }

end
