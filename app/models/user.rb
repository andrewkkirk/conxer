class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email

	has_many :connections

	validates :name, :presence => true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }
	before_save { |user| user.email = email.downcase }

  def connections_params
    {name: self.name, email: self.email}
  end
end
