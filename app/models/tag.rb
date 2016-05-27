class Tag < ActiveRecord::Base
	has_many :hack_tags
	has_many :hacks, through: :hack_tags
end
