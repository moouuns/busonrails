class User < ActiveRecord::Base
	authenticates_with_sorcery!
  has_one :parent
  has_many :enfants

  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => true

  def is_admin?
  	admin
  end

end
