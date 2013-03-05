class User < ActiveRecord::Base
  attr_accessible :email, :isadmin, :name
  has_many :posts
  
  validates :email,   :presence => true
                      
  validates :name,    :presence => true
end
