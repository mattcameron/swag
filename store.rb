class Store < ActiveRecord::Base
	has_many :products

	def self.store_likes
		total = 0
		self.products.each do	|product|
			total += product.likes
		end
		total
	end
end