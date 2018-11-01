## users model created by Richard 30.10.18 as a test for csv output ##
## need to test this!! Needs a users data set before this will work ##

# Best approach: use a format csv handler

class User < ApplicationRecord
<<<<<<< HEAD
	# acts_as_paranoid
	# Include default devise modules. 
	# devise :database_authenticatable, :registerable, :recoverable, :rememberable, :tracka
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
>>>>>>> 0bf88cf111491a696dbedc47fda258d75c35d479

	validates :email, presence: true

	## below some active record assocation examples - variables not yet confirmed 

	# has_many :<%DATABASE ITEM GOES HERE

	def self.assign_from_row(row)
		user = User.where(email: row[:email]).first_or_initialize
		user.assign_attributes row.to_hash.slice(:first_name, :last_name)
	end

	## this includes headers
	## database items need to match the %w{} array! 

	def self.to_csv(options = {}) 
		attributes = %w{id email first_name last_name}

		# HOW TO GET BOTH 'OPTIONS' and 'HEADERS?'
		CSV.generate(options, headers: true) do |csv|
			csv << attributes

			User.all.each do |user|
				attributes.each do |att|
					csv << user.send(att)
				end
			end
		end
	end
end
