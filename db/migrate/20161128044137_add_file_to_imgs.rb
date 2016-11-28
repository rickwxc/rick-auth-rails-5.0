class AddFileToImgs < ActiveRecord::Migration[5.0]

	def self.up
		add_attachment :imgs, :file
	end

	def self.down
		remove_attachment :imgs, :file
	end
end
