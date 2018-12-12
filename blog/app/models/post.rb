class Post < ApplicationRecord
	#Used to upload attachments along with Post (Carrierwave gem)
	mount_uploader :attachment, AttachmentUploader
	#validation for Post title
	validates :title, presence: true,
                    length: { minimum: 5 }
  #creating association with user
 	belongs_to :user
 	#creating association with comments
 	has_many :comments, dependent: :destroy
 	#a method to covert data into CSV format and download file
 	def self.to_csv
 		# attributes = %w{id title description user_id}
 		CSV.generate do |csv|
 			#wrting to CSV
 			csv << column_names
 			all.each do |post|
 				csv << post.attributes.values_at(*column_names)
 			end
 		end	
 	end
end
