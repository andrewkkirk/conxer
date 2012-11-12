class User < ActiveRecord::Base
  attr_accessible :email, :name 
  
	has_many :connections
	
	validates :name, :presence => true
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }
	before_save { |user| user.email = email.downcase }
	
end
