class Task < ActiveRecord::Base
	validates :description, presence: true, uniqueness: { message: "already exists" }
end
