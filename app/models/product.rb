class Product < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :color, presence: true
	validates :measurements, presence: true
	validates :price, presence: true, numericality: {only_integer: true}
	validates :inventory, presence: true, numericality: {only_integer: true}

	has_attached_file :image, :styles => {:medium => "300x300", :thumb => "100x100"}, :default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :image => ["image/jpg", "image/jpeg"]

	belongs_to :category
	has_many :sales
	has_one :location

end
