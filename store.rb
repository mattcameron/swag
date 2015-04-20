class Store < ActiveRecord::Base
	has_many :products

	def store_likes
		total = 0
		self.products.each do	|product|
			total += product.likes
		end
		total
	end

	def avg_price
		total = 0
		no_of_products = self.products.count
		self.products.each do	|product|
			total += product.price
		end
		avg = total / no_of_products
		"%.0f" % avg
	end
end