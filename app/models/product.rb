class Product < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :color, presence: true
	validates :material, presence: true
	validates :measurements, presence: true
	validates :price, numericality: {only_integer: true}, allow_nil: true
	validates :inventory, presence: true, numericality: {only_integer: true}

	has_attached_file :image, :styles => {:medium => "400x400"}, :default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg"]

	belongs_to :category
	has_many :sales
	has_one :location
	has_many :listings

end
