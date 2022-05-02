module Placeholder
	extend ActiveSupport::Concern

	def self.main_image_generator
		"https://designmodo.com/wp-content/uploads/2014/07/free-photos.jpg"
	end

	def self.thumb_image_generator
		"https://lehighvalleyicearena.com/wp-content/uploads/2014/08/300x200.gif"
	end
end