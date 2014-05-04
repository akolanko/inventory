class Sale < ActiveRecord::Base
	validates :price, presence: true, numericality: {only_integer: true}
	validates :shipping_cost, numericality: {only_integer: true}, allow_nil: true
	validates :shipping_paid, numericality: {only_integer: true}, allow_nil: true
	validates :through, presence: true
	
	belongs_to :product
end
