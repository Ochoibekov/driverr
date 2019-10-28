class Comment < ApplicationRecord
	belongs_to :driver
	belongs_to :user
end
