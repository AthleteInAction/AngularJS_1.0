class User < ActiveRecord::Base

	has_secure_password

	attr_accessible :email, :password, :password_confirmation

	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

end