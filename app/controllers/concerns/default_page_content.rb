module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@default_title = "DevcampPortfolio | My Portfolio Website"
		@seo_keywords = "Zaw Lay Pyay Thar Portfolio"
	end
end