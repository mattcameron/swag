class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :store
	has_one :lineitem

	# validates :name, :presence => true
end

