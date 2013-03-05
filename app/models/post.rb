class Post < ActiveRecord::Base
  attr_accessible :address, :category_id, :city, :content, :email, :picture, :title, :user_id
  
  belongs_to :user
  belongs_to :category
  attr_accessible :address, :city, :content, :email, :picture, :title
  validates :address, :length => {:minimum => 5, :maximum => 254}
  validates :email,   :presence => true
                      
  validates :content, :presence => true
  validates :title,   :length => {:minimum => 3, :maximum => 254}
end
