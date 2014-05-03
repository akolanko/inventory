class Location < ActiveRecord::Base
	validates :location, presence: true
	validates :contact_phone, numericality: {only_integer: true}, allow_nil: true

	belongs_to :product
end
