class Post < ActiveRecord::Base
  attr_accessible :address, :city, :content, :email, :picture, :title
  belongs_to :user
  belongs_to :category
  
  before_save { email.downcase! }
  
  validates :category_id, presence: true
  validates :user_id, presence: true 
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:  { with: VALID_EMAIL_REGEX }
  
  default_scope order: 'posts.created_at DESC' 
end
