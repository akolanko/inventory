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

	has_attached_file :image, :styles => {:medium => "400x400"}, :default_url => "/images/:style/missing.jpg", :storage => :s3, :s_3credentials => Proc.new{|a| a.instance.s3_credentials }
	def credentails
		{:bucket => '[AWS_BUCKET]', :access_key_id => ENV['AWS_KEY'], :secret_access_key => ENV['AWS_SECRET']}
	end
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg"]

end
