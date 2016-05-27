class Hack < ActiveRecord::Base
	belongs_to :user
	has_many :favorites
	has_many :hack_tags
	has_many :tags, through: :hack_tags
end
