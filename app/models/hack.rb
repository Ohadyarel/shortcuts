class Hack < ActiveRecord::Base
	belongs_to :user
	has_many :favorites
	has_many :hack_tags
	has_many :tags, through: :hack_tags

	# validates image attachment
	has_attached_file :lhimg, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :lhimg,
	:content_type => /\Aimage\/.*\Z/

end
