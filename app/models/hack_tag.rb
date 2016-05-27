class HackTag < ActiveRecord::Base
	belongs_to :hack
	belongs_to :tag
end
