class Product < ActiveRecord::Base

	belongs_to :category
	has_many :sales
	has_one :location
	has_many :listings

	validates :name, presence: true, uniqueness: true
	validates :color, presence: true
	validates :material, presence: true
	validates :measurements, presence: true
	validates :price, numericality: {only_integer: true}, allow_nil: true
	validates :inventory, presence: true, numericality: {only_integer: true}

	has_attached_file :image, :styles => {:medium => "400x400"}, :default_url => "/images/missing.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg"]
end
