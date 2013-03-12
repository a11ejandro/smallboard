class Post < ActiveRecord::Base
  attr_accessible :address, :city, :content, :email, :title, :image
  #PaperClip
  has_attached_file :image, :styles => { :small => ['128x128#', :jpg]}
  
  belongs_to :user
  belongs_to :category
  
  before_save { email.downcase! }
  
  validates :category_id, presence: true
  validates :user_id, presence: true 
  validates :content, presence: true
  validates :email, presence: true, length: { maximum: 50 }
  validates :city, length: { maximum: 50 }
  validates :address, length: { maximum: 127 }
  validates :title, presence: true, length: { maximum: 50 }
  #PaperClip
  validates_attachment_content_type :image, :content_type => 'image/jpeg'
  
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:  { with: VALID_EMAIL_REGEX }
  
  default_scope order: 'posts.created_at DESC' 
end
