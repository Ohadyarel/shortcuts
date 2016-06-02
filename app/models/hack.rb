class Hack < ActiveRecord::Base
	belongs_to :user
	has_many :favorites
	has_many :hack_tags
	has_many :tags, through: :hack_tags
	acts_as_votable

	# added maxlength to inputfields
	# validates_length_of :title, :maximum => 150
	# validates_length_of :body, :maximum => 150

	# validates image attachment
	has_attached_file :lhimg, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :lhimg,
	:content_type => /\Aimage\/.*\Z/

	attr_accessor :favorite
end
