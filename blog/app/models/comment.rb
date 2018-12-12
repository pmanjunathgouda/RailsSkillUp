class Comment < ApplicationRecord
	#Association with post
  belongs_to :post
end
