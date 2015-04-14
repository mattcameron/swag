class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :store

	# validates :name, :presence => true
end