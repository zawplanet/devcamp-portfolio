class Portfolio < ApplicationRecord
	has_many :technoloogies
	accepts_nested_attributes_for :technoloogies,
								   reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder

	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle: "Angular")
	end

	scope :ruby_on_rails_portfolio, -> { where(subtitle: "Ruby on Rails") }

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.main_image_generator
		self.thumb_image ||= Placeholder.thumb_image_generator
	end

end
