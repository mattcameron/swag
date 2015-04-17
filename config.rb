require 'active_record'

# Database config
local_db = {
	adapter: 'postgresql',
	database: 'photos_app'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || local_db)