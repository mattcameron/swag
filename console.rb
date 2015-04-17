require 'active_record'
require 'pry'


#show sql in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'config'
require_relative 'product'
require_relative 'store'
require_relative 'category'
require_relative 'user'
require_relative 'lineitem'

binding.pry