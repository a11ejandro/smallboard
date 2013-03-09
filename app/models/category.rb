class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :posts, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  
  default_scope order: 'categories.created_at DESC'
end
